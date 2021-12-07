
total = 1
(3..1001).step(2).each do|n| 
	total += n**2
	step = n - 1
	total += n**2 - step
	total += n**2 - 2*step
	total += n**2 - 3*step
end

puts total
