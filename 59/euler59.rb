cipher = File.readlines("p059_cipher.txt").first.split(",")

freqs = {}
cipher.each {|c| freqs[c] = freqs[c] ? freqs[c] += 1 : 1 }
p freqs.sort_by(&:last).reverse

key_space = ("a".."z").to_a.repeated_permutation(3).to_a
key_space.each do |k|
	key = k.join
	keypad = key * (cipher.size / 3)
	message = ""
	(0...cipher.size).each do |n|
		message << (cipher[n].to_i ^ keypad[n].ord).chr
	end

	# p key if message.include?("the")
	# p message if message.include?("the")
	# puts if message.include?("the")

	puts message.split("").map {|c| c.ord}.sum if key == "exp"
end
