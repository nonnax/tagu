#!/usr/bin/env ruby
# Id$ nonnax 2022-04-02 11:35:51 +0800
# simple test
require_relative 'lib/tagu'
require 'irb'
# tm,self_m=Tagu.methods, methods.sort
# pp (tm & self_m).sort.each_slice(7).to_a

def deatched_head
  # modular detachable parts :>
  # nil output unless inside a `tagu` block. 
  head! do
    title! 'this is cool'
    link! rel: 'stylesheet', href: '/css/style.css'
  end
end

tagu(true) do
  html! do
    deatched_head
    body! do
      _header! do 
        'aha'
      end
      _main! do
          br!
          hr!          
          5.times do |n|
            a!(n, href: '/'+n.to_s )
          end
          _item do
            span! 'what', class: 'waklass'
            span! 'who'
            ul! do 
              li 'first' 
              li! 'last' 
            end
            'hi'
          end
         span!{'hello '*3 }
      end
    end
  end
end.
then{|s| puts s.to_s}

