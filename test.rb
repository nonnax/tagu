#!/usr/bin/env ruby
# Id$ nonnax 2022-04-02 11:35:51 +0800
# test framework
require_relative 'lib/tagu'
require 'irb'
# test
# Tagu.define do
tagu do
  html! do
    head! do
      title!{ 'this is cool'}
      link! rel: 'stylesheet', href: '/css/style.css'
    end
    body! do
      div!(class: 'main') do
          br!
          hr!
          a!( href: '/' ){ 'link'}
          p!(class: 'item') do
            span! do
              'what'
            end
            span! do
              'who'
            end
            ul! do 
              li!{ 'first' }
              li!{ 'last' }
            end
            'hi'
          end
         'hello'
      end
    end
  end
end

puts Tagu.result
