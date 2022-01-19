
puts (1..1000).inject(0) {|acc, n| acc + n**n }.to_s[-10..-1]
