#!/usr/bin/env ruby
# Id$ nonnax 2022-04-08 18:25:31 +0800
# Tagu non-magical html markup builder
# include Tagu as needed
# 
require 'stringio'

D=Object.method(:define_method)

module Tagu
  extend self
  SINGLES, buffer, lev=%w[br hr link meta], StringIO.new, 0
  
  D.(:define){ |&block| instance_eval(&block) }
  D.(:result){ buffer.string  }
  D.(:Q){|h| h.inject(""){|acc, (k, v)| acc<<' '<<[k, "'#{v}'"].join('=')}}
  D.(:tab){ "  "*lev }
  D.(:indent) do |&block|
    lev+=1
    block.call
    lev-=1
  end
  
  D.(:tagu) do |&block|
    Tagu.define(&block)
  end

  D.(:tag) do |m, **opts, &block|
    if SINGLES.include?(m.to_s)
      buffer.puts "%s<%s%s/>" % [tab, m, Q(opts)]
      return
    end    
    buffer.puts "%s<%s%s>" % [tab, m, Q(opts)]
    indent do
      content=block.call
      buffer.puts "%s%s" % [tab, content] if content
    end
    buffer.puts "%s</%s>" % [tab, m]
  end

  %w[html head body div p style script h1 h2 h3 h4 h5 h6 a img span b i strong em br link hr meta].each do |m, **opts, &block|
      D.(m.to_s+?!){ |**opts, &block| tag(m, **opts, &block) }  
  end
end

