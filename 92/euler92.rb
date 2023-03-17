start = Time.now
h89 = {4=> true, 16=> true, 20=> true, 37=> true, 42=> true, 58=> true, 85=> true, 89=> true, 145=> true}

count = 0
(1...10000000).each do |n|
  curr = n.digits.inject(0) {|sum, i| sum += i**2}
  while h89[curr] != true
    break if curr == 1
    curr = curr.digits.inject(0) {|sum, i| sum += i**2}
  end
  count += 1 if h89[curr] == true
end

puts count
puts Time.now - start
