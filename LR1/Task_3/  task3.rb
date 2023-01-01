def min_el(arr)
  min_e = arr[0]
  arr.each { |el|
    #min_e = el if el < min_e
    if el < min_e
      min_e = el
    end
  }
  min_e
  #return arr.min
end

def find_all_els(arr,element)
  ines = []
  for i in 0..arr.length
    ines.append(i) if arr[i]==element
  end
  ines
end

def find_first_positive(arr)
  elem = -1
  count = 0
  for el in arr
      return count if el>0
      count +=1
  end
  elem
end

a = [1,-2,3,4,-5,6,]


def task_3_ask()
  p "Введите путь к файлу"
  filepath = gets
  file_1 = File.open("#{filepath.chomp}")
  file_data = file_1.readlines.map(&:chomp).map{ |item|item.to_i }

  p file_data
  "Какой метод хотите выполнить? .1.Найти минимум .2.Найти элементы .3.Найти номер первого положительного элемента".each_line(separator = " .") {|s| p s}
  choose = gets.chomp
  case choose
  when "1"
    puts min_el file_data
  when "2"
    p "Введите элемент для поиска"
    el = gets.chomp.to_i
    puts find_all_els file_data, el
  when "3"
    puts find_first_positive file_data
  else
    puts "Ничем не могу помочь"
  end
end

while 5<10
  task_3_ask
end