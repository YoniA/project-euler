
candidates = []

(1..9).each do |m|
	(1..9).each do |n|
		(1..9).each do |i|
			if( (m.to_s + i.to_s).to_f / (n.to_s + i.to_s).to_f == m/n.to_f)
				candidates << "#{m.to_s + i.to_s}/#{n.to_s + i.to_s}" 
			elsif( (i.to_s + m.to_s).to_f / (i.to_s + n.to_s).to_f == m/n.to_f)
				candidates << "#{i.to_s + m.to_s}/#{i.to_s + n.to_s}" 	
			elsif( (i.to_s + m.to_s).to_f / (n.to_s + i.to_s).to_f == m/n.to_f)
				candidates << "#{i.to_s + m.to_s}/#{n.to_s + i.to_s}" 	
			elsif( (m.to_s + i.to_s).to_f / (i.to_s + n.to_s).to_f == m/n.to_f)
				candidates << "#{m.to_s + i.to_s}/#{i.to_s + n.to_s}"
			end 	
		end
	end
end


p candidates
