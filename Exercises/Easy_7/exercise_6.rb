# Modify the method from the previous exercise so it 
# ignores non-alphabetic characters when determining 
# whether it should uppercase or lowercase each letter. 
# The non-alphabetic characters should still be included 
# in the return value; they just don't count when 
# toggling the desired case.

# algorithm:
#   - Initialize new result empty str variable
#   - Iterate through chars of input str
#   - If char is a letter
#     - Alternate capitalizing and downcasing

def staggered_case(str)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  result = ''
  counter = 0
  str.chars.each do |char|
    if letters.include?(char)
      counter.even? ? result << char.upcase : result << char.downcase
      counter += 1
    else
      result << char
    end
  end

  result
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
