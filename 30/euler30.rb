powers = []

num = 123
sum = 0
num.digits.each do |d| 
	sum += d**5		
end

if sum == num
	powers << num
end

puts powers.sum
