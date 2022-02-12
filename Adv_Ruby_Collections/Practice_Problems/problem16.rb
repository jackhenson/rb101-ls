def create_uuid
  uuid = ''
  possible_values = ('a'..'f').to_a + ('0'..'9').to_a
  8.times { |i| uuid << possible_values[rand(36)] }
  uuid << '-'
  4.times { |i| uuid << possible_values[rand(36)] }
  uuid << '-'
  4.times { |i| uuid << possible_values[rand(36)] }
  uuid << '-'
  4.times { |i| uuid << possible_values[rand(36)] }
  uuid << '-'
  12.times { |i| uuid << possible_values[rand(36)] }

  uuid
end

p create_uuid