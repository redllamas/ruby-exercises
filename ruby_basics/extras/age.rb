puts 'How old are you? '
age = gets.chomp.to_i

[10, 20, 30, 40].each do |i|
  puts "In #{i} years you will be: #{age + i}"
end
