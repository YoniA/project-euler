def is_palindrome(n)
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


palindromes = []
(1...1000000).each do |n|
	if (is_palindrome(n.to_s) && is_palindrome(n.to_s(2)))
		palindromes << n
		puts n, n.to_s(2)
	end
end


puts palindromes.sum

