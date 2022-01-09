
start = Time.now
sum = 0

arr = []
arr2 = []
(1..100).each {|n| arr << 17*n}
arr = arr.filter {|n| n.digits.uniq == n.digits}
p arr

primes = [13, 11, 7, 5, 3, 2]

(0..5).each do |k|
	arr.each do |n|
		(0...9).each do |i|
			next if n.to_s.include?(i.to_s)
			curr = (i.to_s + n.to_s[0..1]).to_i 
			arr2 << (i.to_s + n.to_s) if curr % primes[k] == 0 
		end
	end
	p primes[k], arr2
	arr = arr2
	arr2 = []
end

runtime = Time.now - start

puts arr
puts arr.map {|n| n.to_i}.sum
puts "Runtime: #{runtime}"

