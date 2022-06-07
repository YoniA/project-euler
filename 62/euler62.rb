start = Time.now

h = Hash.new {|hash, key| hash[key] = []}
(1..9999).each do |n|
	h[(n**3).digits.sort] << n
end


puts h.filter {|k, v| v.size == 5}
puts "runtime: #{Time.now - start} seconds."
