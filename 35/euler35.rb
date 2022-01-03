
def circular_shift(n)
	if (n.size == 1)
		return n
	end

	d = n.to_s[0]
	n << d
	n = n[1]
end



