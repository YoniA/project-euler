
Coins = [200, 100, 50, 20, 10, 5, 2, 1]

def f(target, max)
	# halt condition
	if(max == 1 || target == 0)
		return 1
	end
	
	k = (target / max).to_i
	nmax = Coins[Coins.index(max)+1]
	count = 0
	(0..k).each do |i|
		count += f(target - max*i, nmax)
	end

	return count	
end


puts f(200, 200)
