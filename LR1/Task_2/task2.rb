def prime?(number)
  (2..number / 2).each { |i|
    if number % i == 0
      return false
    end
  }
  true
end

def sum_of_prime_derivatives(number)
  sum = 0
  (2..number).each { |i|
    sum +=i if prime? i
  }
  sum
end

puts sum_of_primes 10

