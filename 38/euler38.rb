max = 123456789

def is_pandigital(n)
	n.digits.uniq.size == 9
end


n
(1..9).each do |d|
	result += (result.to_i * d).to_s
	
	if (is_pandigital(result.to_i) && (result.to_i > max))
		max = result
	end
end


