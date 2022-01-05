max = 123456789

def is_pandigital(n)
	n.digits.uniq.sort.join == "123456789"
end


def has_unique_digits(n)
	n.digits.uniq.size == n.digits.size
end


start = Time.now
(1..10000).each do |n|
	curr = n
	(2..9).each do |i|
		curr = curr.to_s + (i*n).to_s
		unless has_unique_digits(curr.to_i)
			break
		end
		
		unless curr.to_i.digits.size < 10
			break
		end
		
		if (is_pandigital(curr.to_i) && (curr.to_i > max))
			max = curr.to_i
			puts "new max is: #{max}"
		end	
	end
end


runtime = Time.now - start

puts max
puts "Runtime: #{runtime} seconds" 

