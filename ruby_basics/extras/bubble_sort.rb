def bubble_sort(array)
  n = array.length
  loop do
    new_n = 0
    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        new_n = i + 1
      end
    end
    n = new_n
    break if n.zero?
  end
  array
end

array = [30, 33, 34, 7, 19, 4, 22, 26, 23, 18, 14, 29, 35, 10, 24, 5, 20, 3, 16, 28, 15, 32, 1, 12, 11, 25, 8, 21, 31,
         13, 2, 17, 6, 27, 9]
puts 'Before: ' + array.to_s
puts 'After: ' << bubble_sort(array).to_s
