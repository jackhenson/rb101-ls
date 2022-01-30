produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  selected_produce = {}
  produce_keys = produce.keys
  counter = 0

  loop do
    break if counter == produce.size

    current_key = produce_keys[counter]
    current_produce = produce[current_key]

    if current_produce == 'Fruit'
      selected_produce[current_key] = current_produce
    end

    counter += 1
  end

  selected_produce
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

