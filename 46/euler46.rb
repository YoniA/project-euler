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

def is_square(n)
	return false if n <= 0
	(n**0.5).to_i**2 == n
end


start = Time.now

# preprocessing

primes = [2]
(3..10001).step(2).each do |n|
	primes << n if is_prime(n)
end

result = -1
(9..10000).step(2).each do |n|
	next if primes.bsearch { |i| n <=> i }
	primes.each do |p|
		result = n if p >= n
		diff = n - p
		break if is_square(diff / 2)
		#puts "#{n} = #{p} + 2*#{diff}"
	end
	break if result > 0
end

runtime = Time.now - start

puts result
puts "Runtime: #{runtime}"
