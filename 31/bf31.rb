
count = 0

(0..1).reverse_each do |a|
	(0..2).reverse_each do |b|
		if ( (a*200 + b*100) > 200 )
			next
		end
		(0..4).reverse_each do |c|
			if ( (a*200 + b*100 + c*50) > 200 )
				next
			end
			(0..10).reverse_each do |d|
				if ( (a*200 + b*100 + c*50 + d*20) > 200 )
					next
				end
				(0..20).reverse_each do |e|
					if ( (a*200 + b*100 + c*50 + d*20 + e*10) > 200 )
						next
					end
					(0..40).reverse_each do |f|
						if ( (a*200 + b*100 + c*50 + d*20 + e*10 + f*5) > 200 )
							next
						end
						(0..100).reverse_each do |g|
							(0..200).reverse_each do |h|
								puts "#{a} #{b} #{c} #{d} #{e} #{f} #{g} #{h}"
								if ( (a*200 + b*100 + c*50 + d*20 + e*10 + f*5 + g*2 + h*1) == 200 )
									count += 1
								end
							end
						end
					end
				end
			end
		end
	end
end

puts count
