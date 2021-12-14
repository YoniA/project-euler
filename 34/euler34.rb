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


(10..1000000).each do |n|
	
	sum = n.digits.inject(0) {|acc, d| acc + factorial(d)}
	if (sum == n)
		perms << n	
		puts n
	end
end


puts perms.sum
