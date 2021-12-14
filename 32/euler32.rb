require 'set'


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



def all_unique(n)
	n.digits.size == n.digits.to_set.size
end

pandigital_products = []
(1000..999990).each do |n|
	unless all_unique(n)
		next
	end
		
	factors(n).each do |d|
		unless all_unique(d) && all_unique(n / d)
			next
		end
		
		 
		if ((d.digits.size + (n/d).digits.size + n.digits.size == 9) && (d.digits.to_set | (n/d).digits.to_set | n.digits.to_set) == [1,2,3,4,5,6,7,8,9].to_set)
			pandigital_products << n
			puts "#{d} #{n/d} #{n}"
			break
		end
	end
end


puts pandigital_products.uniq.sum

