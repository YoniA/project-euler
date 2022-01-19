
(10..1000000).each do |n|
	next unless n.digits.sort == (2*n).digits.sort
	next unless n.digits.sort == (3*n).digits.sort
	next unless n.digits.sort == (4*n).digits.sort
	next unless n.digits.sort == (5*n).digits.sort
	next unless n.digits.sort == (6*n).digits.sort

	puts n
	break
end
