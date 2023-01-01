def min_el(arr)
  min_e = arr[0]
  for el in arr
    min_e = el if el<min_e
  end
  min_e
  #return arr.min
end

a = [1,2,3,4,-5,6,]

puts min_el a