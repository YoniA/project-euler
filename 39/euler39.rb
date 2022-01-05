start = Time.now

h = Hash.new {|h, key| h[key] = []}

(1..100).each do |m|
	(1...m).each do |n|
		a = m**2 - n**2
		b = 2*m*n
		c = m**2 + n**2
	
		h[a+b+c] << [a,b,c].sort if a+b+c <= 1000
	
		(2..100).each do |k|
			h[k*(a+b+c)] << [k*a, k*b, k*c].sort if k*(a+b+c) <= 1000
		end	
	end
end


max = 12
h.keys.each do |p|
	max = p if h[p].uniq.size > h[max].uniq.size

end

runtime = Time.now - start

puts max
puts "Runtime: #{runtime}"
