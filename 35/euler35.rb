
count = 13

def rotate(n)
	if (n.size == 1)
		return n
	end

	n.to_s[1..-1] + n.to_s[0]
end

def is_prime(n)
        if (n < 2)
                return false
        end 
    
        if (n == 2)
                return true
        end 
    
        if(n % 2 == 0)
                return false
        end 

        (3..(n**0.5).to_i).each do |i| 
                if(n % i == 0)
                        return false
                end 
        end    
        return true
end



def all_rotations_prime?(n)
	curr = n
	n.to_i.digits.size.times do
		unless is_prime(curr.to_i)
			return false
		end
		curr = rotate(curr)	
	end
	true	
end


puts all_rotations_prime?(197)

(100..999999).each do |n|
	if(all_rotations_prime?(n))
		count += 1
	end
end



puts count

#puts rotate(197)
#puts rotate(rotate(197))
#puts rotate(rotate(rotate(197)))




