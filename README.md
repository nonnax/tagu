non-magical html markup builder

bang (!) suffixed tags to avoid method name clashes

p!(class: 'item') do  
  span!(class: 'tagu'){ 'who'} # block enclosed
  span! 'what', class: 'tagu'  # as one liner
  ul! do 
    li!{ 'first' }
    li! 'last'  # as a one liner
  end
  'hi'
end
