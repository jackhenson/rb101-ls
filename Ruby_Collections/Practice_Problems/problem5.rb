flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do | name, index |
  puts index if name.start_with?('Be')
end

p flintstones.index { |name| name[0, 2] == "Be" }

p flintstones.index { |name| name.start_with?('Be') }