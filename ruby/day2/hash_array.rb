=begin
def hash_to_array hash
  arr = []
  hash.each_value {|v| arr.push v}
  arr
end

def array_to_hash arr
  hash = {}
  arr.each_with_index {|e, i| hash[i] = e}
  hash
end

hash = {'a' => 10, 'b' => 20 }
arr = hash_to_array hash 

puts "Hash to array: #{arr}"
puts "Array to hash: #{array_to_hash arr}"
=end

puts 'Sixteen array'

arr = Array(0..15)

arr.each_slice(4) {|e| print e }
