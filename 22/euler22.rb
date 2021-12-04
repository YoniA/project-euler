total = 0

File.foreach("sorted-names.txt").with_index do |name, i|
	val = 0;
	name.chomp.each_char { |c| val += c.ord - 64 }
	total += val * (i+1)
end

puts total
