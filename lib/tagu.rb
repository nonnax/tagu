#!/usr/bin/env ruby
# Id$ nonnax 2022-04-08 18:25:31 +0800
# Tagu non-magical html markup builder
# include Tagu as needed
# 
require 'stringio'
module Tagu
  D,builder,SINGLES,lev,indents = Object.method(:define_method), StringIO.new, %w[br hr link meta],0
  D.(:define){ |&block| builder.string=''; instance_eval(&block) }
  D.(:tagu){ |indent=false, &block| indents=indent; Tagu.define(&block); builder.string }
  
  %w[html head title body div p ul li style script h1 h2 h3 h4 h5 h6 a img span b i strong em br link hr meta]
  .each do |m, **opts, &block| D.(m.to_s+?!){ |*a, &block| tag(m, *a, &block) }  end
  
  def self.method_missing(m, *a, &block)
    # div shortcuts 
    # _name into class='name' 
    # _name! into id='name'
     opts=a.grep(Hash).pop || {}
     if match=m.match(/^_(.+[^!])$/)
      send(:div!, opts.merge(class: match.to_a.pop) , &block) 
     elsif match=m.match(/^_(.+)!$/)
      send(:div!, opts.merge(id: match.to_a.pop) , &block)
     else
      send(:div!, opts.merge(id: m) , &block)
     end
  end
  
  private
  D.(:tag) do |m, *a, &block|
    h=a.grep(Hash)
    a-=h
    opts=h.pop || {}
    return builder.puts "%s<%s%s/>" % [tab, m, Q(opts)] if SINGLES.include?(m.to_s)         
    builder.puts "%s<%s%s>" % [tab, m, Q(opts)]
    _i do
      text = block ? block.call : a.pop
      builder.puts "%s%s" % [tab, text] if text
    end
    builder.puts "%s</%s>" % [tab, m]
  end  

  D.(:result){ builder.string  }
  D.(:Q){|h| h.inject(""){|acc, (k, v)| acc<<' '<<[k, "'#{v}'"].join('=')}}
  D.(:tab){ "  "*lev }
  D.(:_i){|&block| return block.() unless indents; lev+=1; block.(); lev-=1  }  
end
