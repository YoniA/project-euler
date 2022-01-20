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


start = Time.now

primes = (10001..999999).step(2).filter { |n| is_prime(n) }
indices = %w[0 1 2 3 4].permutation.map(&:join).map {|w| w[0..2]}
result = -1

primes.each do |p|
	indices.each do |ind|
		i = ind[0].to_i
		j = ind[1].to_i
		k = ind[2].to_i

		family = []
		(0..9).each do |d|
			break if d >= 2 && family.size == 0
			q = p.to_s
			q[i] = d.to_s
			q[j] = d.to_s
			q[k] = d.to_s
			next unless primes.bsearch { |n|  q.to_i <=> n }
			family << q.to_i
			result = family.min if family.size == 8
			break if result > 0
			
		end
		break if result > 0	
	end
	break if result > 0
end

runtime = Time.now - start

puts result
puts "Runtime: #{runtime}"
