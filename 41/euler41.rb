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



def is_pandigital(n)
	str = n.to_s.chars.sort.join
	"123456789"[str] && "123456789".index(str) == 0
end


# all digit numbers (1-9) is impossible in any order, since the sum 45 is divisible by 9
# 1-8 digits are impossible, since the sum 36 is divisible by 9
# hence 9 cannot appear
# hence 8 cannot appear

Max = 7654321 

start = Time.now
Max.downto(1000) do |n|
	next unless n.digits.uniq.size == n.digits.size
	next unless n % 2 != 0
	next unless !n.digits.include?(0)
	next unless !n.digits.include?(9)
	next unless !n.digits.include?(8)
	if (is_pandigital(n) && is_prime(n))
		puts n
		break
	end
end

runtime = Time.now - start
puts "Runtime: #{runtime}"

#puts is_pandigital(2143)
#puts is_pandigital(2345)


