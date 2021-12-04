require 'set'

LIMIT = 28123 



def proper_divisors(n)
	divisors = [1]
	(2..(n**0.5).to_i).each do |i|
		if(n % i == 0)
			divisors << (n / i)
			divisors << (n/ (n/i))
		end
	end
	divisors.uniq
end


def is_abundant(n)
	n < proper_divisors(n).sum
end

abundants =[]
(2..LIMIT).each do |n|
	if(is_abundant(n))
		abundants << n
	end
end


abundant_sums = []
abundants.each do |i|
	abundants.each do |j|
		if (i <= j)
			abundant_sums << i+j
		end
	end
end


puts (Set.new(1..LIMIT) - Set.new(abundant_sums)).sum
