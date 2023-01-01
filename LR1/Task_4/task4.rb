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

a = [1,7,3,4,-5,6,10,9]


p task37 a

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