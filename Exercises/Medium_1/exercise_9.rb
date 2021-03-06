# In the previous exercise, we developed a recursive 
# solution to calculating the nth Fibonacci number. 
# In a language that is not optimized for recursion, 
# some (not all) recursive methods can be extremely 
# slow and require massive quantities of memory 
# and/or stack space.

# Ruby does a reasonably good job of handling recursion, 
# but it isn't designed for heavy recursion; as a result, 
# the Fibonacci solution is only useful up to about 
# fibonacci(40). With higher values of nth, the recursive 
# solution is impractical. (Our tail recursive solution 
#   did much better, but even that failed at 
#   around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten 
# as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it 
# computes its results without recursion.



def fibonacci(n)
  return n if n == 1
  seq = [1, 1]
  until seq.size == n
    seq << (seq[-2] + seq[-1])
  end

  seq[n-1]
end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001) # => 4202692702.....8285979669707537501
