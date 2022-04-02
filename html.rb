#!/usr/bin/env ruby
# Id$ nonnax 2022-04-02 11:35:51 +0800
# test framework
require_relative 'lib/tagu'

s = Tagu.do do
  head do
    link(rel: 'stylesheet', src: '/css/style.css')
  end
    .and body {
           div(id: 'main', class: 'container') do
             h1('this is the title')
               .and  br
               .and  div(class: 'item') { span 'test' }
               .and  hr
               .and  div(class: 'item') {
                       span { 'test 2' }
                         .and span { p 'haha' }
                     }
           end
           .and p { 'footer' }
           .and para(id: 'foot') { 'footer again' }
         }
end

puts s
