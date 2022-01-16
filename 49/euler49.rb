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

STEP = 3330
primes = (1488..9999).filter { |n| is_prime(n) }

result = -1

primes.each do |p|
	next unless is_prime(p + STEP)
	next unless p.digits.sort == (p + STEP).digits.sort
	next unless is_prime(p + 2*STEP)
	next unless p.digits.sort == (p + 2*STEP).digits.sort

	result = p.to_s + (p + STEP).to_s + (p+2*STEP).to_s
	break
end

runtime = Time.now - start

puts result
puts "Runtime: #{runtime}"
