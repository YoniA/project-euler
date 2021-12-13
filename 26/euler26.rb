require 'set'

def divisors(n)
	arr = [1, n]
	(2..(n**(0.5)).to_i).each do |d|
		if (n % d == 0)
			arr << d
			arr << n / d
		end
	end
	
	arr.uniq
end


def gcd(n, k)
	(divisors(n).to_set & divisors(k).to_set).to_a.max
end


# Euler Totient function
def phi(n)
	arr = []
	(1..n).each do |k|
		if (gcd(n, k) == 1)
			arr << k
		end
	end

	arr.size
end



def period(d)
	period = divisors(phi(d)).max
	divisors(phi(d)).each do |k|
		if ((10**k - 1) % d == 0 && (k < period))
			period = k
		end
	end

	period
end


max_d = 1
max_period = 1
(1..1000).each do |d|
	period = period(d)
	if (period > max_period)
		max_d = d
		max_period = period
	end				
end


puts max_d

#https://math.stackexchange.com/questions/377683/length-of-period-of-decimal-expansion-of-a-fraction

# tests:

#p divisors(12)
#p divisors(13)
#p divisors(16)
#p divisors(998)
#
#puts "======"
#
#puts phi(12)
#puts phi(13)
#
#puts "====="
#
#puts gcd(5, 13)
#puts gcd(8, 12)
#
#puts "===="
#
#p divisors(phi(998))
#
#puts "period length of 1/7: #{period(7)}"
#puts "period length of 1/3: #{period(3)}"
#puts "period length of 1/167: #{period(167)}"
#puts "period length of 1/2: #{period(2)}"
#puts "period length of 1/4: #{period(4)}"
#puts "period length of 1/998: #{period(998)}"
#puts "period length of 1/499: #{period(499)}"
