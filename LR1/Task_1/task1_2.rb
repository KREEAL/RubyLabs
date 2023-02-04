if ARGV.count < 1
  puts "Какого дьявола ты здесь шумишь?"
  return
end


puts 'Как Вас зовут?'

username = ARGV[0]
puts "Здравствуйте, #{username}!"
puts "Какой Ваш любимый язык программирования?"
lang = STDIN.gets.chomp.downcase

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