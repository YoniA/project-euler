
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


def truncator(n)
	arr = [n]
	if(n.size == 1)
		return arr
	end
	(0...(n.size)).each do |i|
		arr << n[0..i]
		arr << n[-i-1..-1]
	end

	return arr.uniq.delete_if {|m| m.to_s.size < 1}
end


truncatable_primes = []

n = 9
while (truncatable_primes.size < 11) do
	n += 2
	if(truncator(n.to_s).any? { |m| !is_prime(m.to_i) })
		next
	end

	truncatable_primes << n
end



puts truncatable_primes.sum
