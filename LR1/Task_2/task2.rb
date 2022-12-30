#Определение простоты числа
def prime?(number)
  (2..Math.sqrt(number)).each { |i|
    if number % i == 0
      return false
    end
  }
  true
end

#Нахождение суммы простых делителей
def sum_of_prime_derivatives(number)
  sum = 0
  (2..number).each { |i|
    sum +=i if prime? i
  }
  sum
end

puts sum_of_prime_derivatives 10


#Нахождение количества четных/нечетных цифр, больше/меньше заданного числа. Параметры:
# oddeven: любое число. Его четность - четность искомых цифр
# greaterlower: если число положительное, то поиск будет работать как "Строго больше". Отрицательное наоборот
def odd_even_greater_lower_digits_count (number,oddeven,greaterlower,digit)
  count = 0
  gold_ost = oddeven%2
  grlob = false
  grlob = true if greaterlower >= 0
  while number != 0
    ost = number % 10
    if ost%2 == gold_ost and ((ost > digit and grlob) or (ost<digit and !grlob))
      count+=1
    end
    number /=10
  end
  count
end

puts odd_even_greater_lower_digits_count 123456789,1, 1,3

def sumcifr(number)
  acc = 0
  while number != 0
    ost = number%10
    acc += ost
    number/=10
  end
  acc
end

puts sumcifr 123

#Найти произведение делителей числа, сумма цифр которых меньше суммы цифр исходного

def appl_derivatives(number)
  appl = 1
  touched = false
  number_sumcifr = sumcifr number
  (2..Math.sqrt(number)).each {|i|
    if sumcifr i < number_sumcifr
      appl*=i
      touched = true
    end
    }
  if touched
    appl
  else
    0
  end
end

puts appl_derivatives 36