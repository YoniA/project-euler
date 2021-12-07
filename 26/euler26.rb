(1..1000).each do |n|
	curr = (1.0 / n).to_s
	#if(curr.scan(curr[2..8]).size > 1)
	if(curr[3..11] == curr[12..20] || curr[4..12]==curr[13..21]) 
		p n, curr, curr.size
	end
end



#https://math.stackexchange.com/questions/377683/length-of-period-of-decimal-expansion-of-a-fraction
