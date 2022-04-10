require '../utils/utils'

# number of elements along the diagonal lines
def num_diagonals(n) 
	((n-1)/2) * 4 + 1	
end


start = Time.now

diag_prime_count = 0
n = 3 #side length
while true
	corners = [n**2, n**2-(n-1), n**2-2*(n-1), n**2-3*(n-1)]
	corners.each do |c|
		diag_prime_count +=1 if is_prime(c)
	end

	break if diag_prime_count.to_f / num_diagonals(n) < 0.1
	n += 2
end


puts n
puts "Runtime: #{Time.now - start}"
