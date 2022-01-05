# sed "s/\"//g" p042_words.txt | sed "s/,/\n/g" > names-clean.txt


def triangle(n)
	(n*(n+1)*0.5).to_i
end

 
ASCII_OFFSET = 64

def word_val(w) 
	w[0...-1].bytes.inject(0) {|acc, b| acc + (b-ASCII_OFFSET)}
end


start = Time.now
count = 0

MAX_WORD_VAL = 20*26 # zzz...z  
triangles = []
(1..MAX_WORD_VAL).each {|n| triangles << triangle(n)}


File.foreach("names-clean.txt") do |name|
	count +=1 if triangles.include?(word_val(name))
end

runtime = Time.now - start

puts count
puts "Runtime: #{runtime}"
