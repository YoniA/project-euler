def is_palindrome(n)
	n = n.to_s
        if (n.size == 1)
                return true
        elsif(n.size == 2)
                return n[0] == n[1]
        elsif (n[0] == n[-1])
                return is_palindrome(n[1...-1])
        else
                return false
        end
end


lychrel_numbers = 0
LYCHREL_THRESHOLD = 49

9999.downto(1).each do |n|
	LYCHREL_THRESHOLD.times do
		n = n + n.digits.join.to_i
		break if is_palindrome(n)
	end
	next if is_palindrome(n)
	lychrel_numbers += 1
end


puts lychrel_numbers 
