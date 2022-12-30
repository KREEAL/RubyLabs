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

puts sum_of_prime_derivatives 10

def odd_greater_3(number)
  count = 0
  while number > 0
    ost = number % 10
    count+=1 if ost%2 == 1 and ost >3
    number /=10
  end
  count
end

puts odd_greater_3 123456789

