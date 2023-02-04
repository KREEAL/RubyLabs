require 'set'
#Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального.
def find_count_elems_after_last_min(arr)
  arr.reverse!.find_index(arr.max)
end


#Дан целочисленный массив. Необходимо разместить элементы,расположенные до минимального, в конце массива
def move_elems_before_min_to_end(arr)

arr.slice(arr.index(arr.min)..arr.length-1) + arr.slice(0..arr.index(arr.min)-1)

end

#Дан целочисленный массив и интервал a..b. Необходимо найти максимальный из элементов в этом интервале.
def find_max_el_in_interval(arr, a, b)
  newa = Array.new((b-a).abs+1){|i| i+[a,b].min}
  (arr & newa).max
end

#1.37 Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел

def indecies_smaller_than_left_neighbour_and_count_of_it(arr, index=1, count=0)
  if arr.length == 1
    count
  else
    if arr[1]<arr[0]
      p index
      indecies_smaller_than_left_neighbour_and_count_of_it(arr.slice(1, arr.length-1), index+1, count+1)
    else
      indecies_smaller_than_left_neighbour_and_count_of_it(arr.slice(1, arr.length-1), index+1, count)
    end
  end
end


def prime?(number)
  (2..Math.sqrt(number)).each { |i|
    if number % i == 0
      return false
    end
  }
  true
end


def get_prime_derivatives(num,m=1,der_arr=[])
  if m<=num
    if num%m ==0 && (prime? m)
      der_arr.push(m)
    end
    get_prime_derivatives(num,m+1,der_arr)
  else
    der_arr
  end
end


#1.49. Для введенного списка положительных чисел построить список всех положительных простых делителей элементов списка без повторений.
def make_list_set_of_positive_prime_derivatives(arr, arr_der=[])
  if arr.length == 0
    arr_der.to_set.to_a.sort!
  else
    make_list_set_of_positive_prime_derivatives(arr.slice(1, arr.length-1), arr_der+get_prime_derivatives(arr[0]))
  end
end

while 0!=1
  p "Введите длину списка"
  len = gets.chomp.to_i
  a =[]
  p "Вводите список"
  for i in 0...len
    a.append(gets.chomp.to_i)
  end

  mark = true
  while mark
  p "Задача: 1, 13, 25, 37, 49"
  input = gets.chomp.to_i


  case input
  when input = 1
    puts find_count_elems_after_last_min a
  when input = 13
    puts move_elems_before_min_to_end a
  when input = 25
    p "Введите a"
    aa = gets.chomp.to_i
    p "Введите b"
    bb = gets.chomp.to_i
    puts find_max_el_in_interval a, aa, bb
  when input = 37
    puts indecies_smaller_than_left_neighbour_and_count_of_it a
  when input = 49
    puts make_list_set_of_positive_prime_derivatives a

  else
    puts "nothing to see here"
    mark = false
  end
  end
end