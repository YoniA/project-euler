

pandigitals = %w[0 1 2 3 4 5 6 7 8 9].permutation.map(&:join)


candidates = []

pandigitals.each do |n|
	next unless n[7..9].to_i % 17 == 0 
	next unless n[6..8].to_i % 13 == 0 
	next unless n[5..7].to_i % 11 == 0 
	next unless n[4..6].to_i % 7 == 0 
	next unless n[3..5].to_i % 5 == 0 
	next unless n[2..4].to_i % 3 == 0 
	next unless n[1..3].to_i % 2 == 0 

	candidates << n
end

puts candidates.inject(0) { |sum, n| sum + n.to_i }
