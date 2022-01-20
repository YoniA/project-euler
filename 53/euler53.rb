
def factorial(n)
	(1..n).inject(1) { |acc, i|  acc*i }
end


candidates = []

(23..100).each do |n|
	(2...n).each do |k|
		n_choose_k = factorial(n) / (factorial(k)*factorial(n-k))
		candidates << n_choose_k if n_choose_k > 1000000
	end
end


puts candidates.size
