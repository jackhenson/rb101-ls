# return an array containing the colors of the fruits 
#   and the sizes of the vegetables. The sizes should
#   be uppercase and the colors should be capitalized

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = hsh.values.map do | hash |
  if hash[:type] == 'fruit'
    hash[:colors].each { |color| color.capitalize!}
  elsif hash[:type] == 'vegetable'
    hash[:size].upcase
  end
end

p new_arr
