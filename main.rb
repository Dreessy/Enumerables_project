require "./enumerable.rb"

arr = [1, 2, 3, 4, 5, 6, 7]
hash = {
  first: 1,
  second: 2,
  third: -1,
  fourth: 3
}

puts "my_each vs. each"
arr.my_each  { |item| puts item }
arr.each  { |item| puts item }

puts "my_each_with_index vs. each_with_index"
p arr.my_each_with_index {|item, index| puts "#{index}: #{item}"}
p arr.each_with_index {|item, index| puts "#{index}: #{item}"}

puts "\nMy Select"
p arr.my_select(&:even?)
p(hash.my_select { |_k, v| v > 1 })
puts "\nSelect"
p arr.select(&:even?)
p(hash.select { |_k, v| v > 1 })

puts "\nMy All"
p arr.my_all?(&:even?)
p(hash.my_all? { |_k, v| v > 1 })
puts "\nAll"
p arr.all?(&:even?)
p(hash.all? { |_k, v| v > 1 })

puts "\nMy Any"
p arr.my_any?(&:even?)
p(hash.my_any? { |_k, v| v > 1 })
puts "\nAny"
p arr.any?(&:even?)
p(hash.any? { |_k, v| v > 1 })

puts "\nMy None"
p arr.my_none?(&:even?)
p(hash.my_none? { |_k, v| v > 1 })
puts "\nNone"
p arr.none?(&:even?)
p(hash.none? { |_k, v| v > 1 })

puts "\nMy Count"
p arr.my_count(&:even?)
p(hash.my_count { |_k, v| v > 1 })
puts "\nCount"
p arr.count(&:even?)
p(hash.count { |_k, v| v > 1 })

puts "\nMy Map"
p(arr.my_map { |item| item + 3 })
p(hash.my_map { |_k, v| v + 1 })
puts "\nMap"
p(arr.map { |item| item + 3 })
p(hash.map { |_k, v| v + 1 })

puts "\nMy Inject"
p(arr.my_inject { |sum, number| sum + number })
puts "\nInject"
p(arr.inject { |sum, number| sum + number })

my_proc = proc { |item| item + 3 }

p arr.my_map_both(my_proc)
p(arr.my_map_both { |item| item + 3 })
