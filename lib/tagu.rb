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
  D.(:tagu){ |&block| Tagu.define(&block) }

  D.(:tag) do |m, *a, &block|
    h=a.grep(Hash)
    a-=h
    opts=h.pop || {}
    return buffer.puts "%s<%s%s/>" % [tab, m, Q(opts)] if SINGLES.include?(m.to_s) 
        
    buffer.puts "%s<%s%s>" % [tab, m, Q(opts)]
    indent do
      content = a.pop
      content = block.call if block
      buffer.puts "%s%s" % [tab, content] if content
    end
    buffer.puts "%s</%s>" % [tab, m]
  end

  %w[html head title body div p ul li style script h1 h2 h3 h4 h5 h6 a img span b i strong em br link hr meta].each do |m, **opts, &block|
      D.(m.to_s+?!){ |*a, &block| tag(m, *a, &block) }  
  end
end

