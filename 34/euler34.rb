digits = [0, 1, 2, 3, 4, 5, 6]

numbers = digits.repeated_combination(6).to_a

perms = []


def factorial(n)
	fact = 1
	(2..n).each do |d|
		fact *= d
	end
	fact
end

puts factorial(4)

numbers.each do |a|
	n = a.join("").to_i
	sum = 0
	a.each do |d|
		sum += factorial(d)
	end
	if (sum == n)
		perms << n	
	end
end


p perms
