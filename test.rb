#!/usr/bin/env ruby
# Id$ nonnax 2022-04-02 11:35:51 +0800
# test framework
require_relative 'lib/tagu'

# test

Tagu.define do
  html do
    body do
      div(class: 'main') do
          br
          hr
          link
          p(class: 'item') do
            span do
              'what'
            end
            span do
              'who'
            end
            'hi'
          end
         'hello'
      end
    end
  end
end
puts Tagu.result
