> What do each of these puts statements output?

    a = %w(a b c d e)
    puts a.fetch(7)
    puts a.fetch(7, 'beats me')
    puts a.fetch(7) { |index| index**2 }

### Solution

    # puts a.fetch(7)
    Error

    # puts a.fetch(7, 'beats me')
    'beats me'
    
    # puts a.fetch(7) { |index| index**2 }
    49
    