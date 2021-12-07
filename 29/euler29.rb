powers = []

(2..100).each do |a| 
	(2..100).each do |b|
		powers << a**b			
	end
end

puts powers.uniq.size
