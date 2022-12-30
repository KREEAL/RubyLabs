
ruby_command = gets
puts "#{ruby_command}"

# если при вводе написать TYPE C:\Users\kirya\RubymineProjects\RubyLabs\LR1\Task_1\task1_3.rb, то получим на экран содержимое файла. Прикольно, классно
os_command = gets
  puts `#{os_command}`

