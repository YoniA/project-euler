
result = -1
(1..99).each do |a|
	(1..99).each do |b|
		s = (a**b).digits.sum
		result = s if s > result	
	end
end

puts result
