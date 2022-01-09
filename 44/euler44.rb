
def p(n)
	(n*(3*n - 1)*0.5).to_i
end


start = Time.now

# preprocessing
# generate the array once
# the array is sorted since p is monotonic => we can use binary search
pentagonals = []
(1..10000).each do |n|
	pentagonals << p(n)
end


candidates = []

(1..10000).each do |k|
	(1...k).each do |j|
		next unless pentagonals.bsearch { |n| (p(k) + p(j)) <=> n }
		next unless pentagonals.bsearch { |n| (p(k) - p(j)) <=> n }
		candidates << p(k) - p(j)
	end
end

runtime = Time.now - start


puts candidates.min
puts "Runtime: #{runtime}"
