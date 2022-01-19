def is_prime(n)
        return true if n == 2
        return false if n % 2 == 0 || n < 2

        (3..(n**0.5).to_i).each do |i|
                if(n % i == 0)
                        return false
                end
        end
        return true
end

primes = (2..999).filter { |n| is_prime(n) }


max = 6


