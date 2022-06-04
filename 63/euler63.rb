# observe that for any number k, the number of digits in 10**k will be k+1.
# thus, for each power, we can run only on the range 1..9
# before moving to the next power.


result = 0
(1..100).each do |pow|
	next if (9**pow).digits.size < pow # optimization to save iterations
	(1..9).each do |n|
		num = n**pow
		break if num.digits.size > pow
		result += 1 if num.digits.size == pow
	end
end
	
puts result
