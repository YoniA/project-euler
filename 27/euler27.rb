
def is_prime(n)
	if (n < 2)
		return false
	end
	
	if (n == 2)
		return true
	end
		
	if(n % 2 == 0)
		return false
	end

	(3..(n**0.5).to_i).each do |i|
		if(n % i == 0)
			return false
		end
	end	
	return true
end


def count_consecutive_primes(a, b)
	n = 0
	while (is_prime(n**2 + a*n + b))
		n += 1
	end

	return n
end


puts count_consecutive_primes(1, 41)
puts count_consecutive_primes(-79, 1601)


result = 0
max_primes = 40
(-999..999).each do |a|
	(-1000..1000).each do |b|
		consecutive = count_consecutive_primes(a, b)
		if (consecutive > max_primes)
			max_primes = consecutive
			result = a*b
		end		
	end
end


puts result
