require 'set'
#Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального.
def task1(arr)
  arr.reverse!.find_index(arr.min)
end


#Дан целочисленный массив. Необходимо разместить элементы,расположенные до минимального, в конце массива
def task13(arr)
  arr.slice(arr.min..arr.length)+arr.slice(0..arr.min-1)
end


#Дан целочисленный массив и интервал a..b. Необходимо найти максимальный из элементов в этом интервале.
def task25(arr,a,b)
  newa = Array.new((b-a).abs+1){|i| i+[a,b].min}
  (arr & newa).max
end


#1.37 Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел

def task37(arr,index=1,count=0)
  if arr.length == 1
    count
  else
    if arr[1]<arr[0]
      p index
      task37(arr.slice(1,arr.length-1),index+1,count+1)
    else
      task37(arr.slice(1,arr.length-1),index+1,count)
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
def task49(arr,arr_der=[])
  if arr.length == 0
    arr_der.to_set.to_a.sort!
  else
    task49(arr.slice(1,arr.length-1),arr_der+get_prime_derivatives(arr[0]))
  end
end

a = [25,36,12,17,49,39]


p task49 a

# while 0!=1
#   p "1,13,25,37,39"
#   input = gets.chomp.to_i
#   case input
#   when input = 1
#     puts "1"
#   when input = 13
#     puts "1"
#   when input = 25
#     puts "1"
#   when input = 37
#     puts "1"
#   when input = 49
#     puts "1"
#
#   else
#     puts "nothing to see here"
#   end
# end