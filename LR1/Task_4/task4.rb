#Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального.
def task1(arr)
  arr.reverse!.find_index(arr.min)
end



a = [1,5,1,5,1,5,1,5,1,5,1,5,-4,4,6,-2,-1,8,]

p task1 a

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