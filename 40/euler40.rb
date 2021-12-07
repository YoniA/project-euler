
concat = ""
(1..1000000).each do |n|
	concat += n.to_s
end

i = 1
result = 1
while (i <= 1000000) do
	puts i
	result *= concat[i-1].to_i
	i *= 10
end

puts result

