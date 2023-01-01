#Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального.
def task1(arr)
  arr.reverse!.find_index(arr.min)
end


#Дан целочисленный массив. Необходимо разместить элементы,расположенные до минимального, в конце массива
def task13(arr)
  arr.slice(arr.min..arr.length)+arr.slice(0..arr.min-1)
end

a = [1,2,3,4,-5,6,7,8,9]

p task13 a

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