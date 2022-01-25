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

primes = (2..999999).filter { |n| is_prime(n) }

MAX_WIN_SIZE = primes.size
size = 2

while size < MAX_WIN_SIZE
	(0...(MAX_WIN_SIZE - size)).each do |i|
		s = primes[i..(i+size)].sum
		if primes.bsearch { |p|  s <=> p }
			size += 1
			puts "size: #{size}, p: #{s}"
			break	
		end
	end
	size += 1
end
