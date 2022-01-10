
def t(n)
	(n*(n+1)*0.5).to_i
end

def p(n)
	(n*(3*n-1)*0.5).to_i
end

def h(n)
	n*(2*n-1)
end


start = Time.now

triangles = []
pentagons = []
hexagons = []

# preprocessing
(1..100000).each do |i|
	triangles << t(i)
	pentagons << p(i)
	hexagons << h(i)
end

(286..100000).each do |n|
	next unless pentagons.bsearch { |k| t(n) <=> k }
	next unless hexagons.bsearch { |k| t(n) <=> k }
	puts t(n)
	break
end

runtime = Time.now - start
puts "Runtime: #{runtime}"

