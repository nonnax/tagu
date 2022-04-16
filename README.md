# non-magical html markup builder

bang (!) suffixed tags to avoid method name clashes

```ruby
    p!(class: 'item') do  
      span!(class: 'tagu'){ 'who'} # block enclosed
      span! 'what', class: 'tagu'  # as one liner
      ul! do 
        li!{ 'first' }
        li! 'last'  # as a one liner
      end
      'hi'
    end

```

# div method shortcuts 

     _name{} into `<div class='name'></div>`
    _name!{} into `<div id='name'></div>`
