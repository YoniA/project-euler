def is_prime(n)
	return true if n == 2
	return false if n % 2 == 0 || n < 2

        (3..(n**0.5).to_i).each do |i|
                if(n % i == 0)
                        return false
                end
        end
        return true
end


def factors(n)
        arr = [1, n]
        (2..(n**(0.5)).to_i).each do |d|
                if (n % d == 0)
                        arr << d
                        arr << n / d
                end
        end
        arr.uniq
end


def prime_factors(n)
	factors(n).filter { |f| is_prime(f) }
end


#p prime_factors(644)
#p prime_factors(645)
#p prime_factors(646)


start = Time.now

result = -1
i = 16
while i < 1000000
	
	unless prime_factors(i+3).size == 4 
		i = i+4
		next
	end
	unless prime_factors(i+2).size == 4 
		i = i+3
		next
	end
	unless prime_factors(i+1).size == 4
		i = i+2
		next
	end
	unless prime_factors(i).size == 4
		i = i+1
		next
	end

	result = i
	break
end	
 
runtime = Time.now - start

puts result
puts "Runtime: #{runtime}"


