puts 'Как Вас зовут?'

name = gets

puts "Здравствуйте, #{name}"
puts "Какой Ваш любимый язык программирования?"
lang = gets

if lang !="ruby"
  if lang !="Pascal"
    if lang !="Python"
      puts "Чертов Гарри Поттер"
    else
      puts "Оставим это на твоей совести"
    end
  else
    puts 'Вижу старика за монитором'
  end
else
  puts "ПОДЛИЗА!"
end