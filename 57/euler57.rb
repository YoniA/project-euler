def f(n)
	return 0 if n == 0
	1r/(2+f(n-1))
end


start = Time.now

count = 0
1.upto(1000).each do |n|
	frac = 1 + f(n)
	count += 1 if frac.numerator.digits.size > frac.denominator.digits.size
end


puts count
puts "Runtime: #{Time.now - start}"
