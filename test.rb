#!/usr/bin/env ruby
# Id$ nonnax 2022-04-02 11:35:51 +0800
# test framework
require_relative 'lib/tagu'
require 'irb'
# test
# Tagu.define do
tm,self_m=Tagu.methods, methods.sort
pp (tm & self_m).sort.each_slice(7).to_a

tagu do
  html! do
    head! do
      title! 'this is cool'
      link! rel: 'stylesheet', href: '/css/style.css'
    end
    body! do
      div!(class: 'main') do
          br!
          hr!
          a!('link', href: '/' )
          p!(class: 'item') do
            span! 'what', class: 'waklass'
            span! 'who'
            ul! do 
              li! 'first' 
              li! 'last' 
            end
            'hi'
          end
         'hello'
      end
    end
  end
end
.then{|s| puts s}

