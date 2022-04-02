#!/usr/bin/env ruby
# frozen_string_literal: true

# Id$ nonnax 2022-04-02 00:30:16 +0800
# tagu : non-magical html markup builder
#
class String
  def and(body = nil, &block)
    self << "\n" << (body || block.call).to_s
  end
end

class Tagu
  def self.do(&block)
    new.instance_eval(&block)
  end

  def tag(tag_name, text = nil, **params, &block)
    []
    opts = params.to_a.inject([]) { |acc, (k, v)| acc << [k, %('#{v}')].join('=') }

    if block || text
      "<#{tag_name} #{opts.join(' ')}>\n#{text || block.call}\n</#{tag_name}>".gsub(/\s*>/, '>')
    else
      "<#{tag_name} #{opts.join(' ')}/>"
    end
  end

  %i[html head style body div p span h1 h2 h3 h4 h5 b i strong em para].each do |m|
    define_method(m) { |text = nil, **params, &block| tag(m, text, **params, &block) }
  end
  # no-body methods
  %i[link meta br hr].each do |m|
    define_method(m) { |text = nil, **params| tag(m, text, **params) }
  end
end
