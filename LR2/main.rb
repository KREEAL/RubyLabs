require_relative 'student'


student1 = Student.new("Tsvetkov","Kirill","Alexandrovich",{telephone:"+79649265792"})
student2 = Student.new("Ivanov","Ivan","Ivanovich",{telegram:"VanyaPro",mail:"vanyavanyavanya@mail.ru",telephone:"+7964926582"})
student3 = Student.new("Matcumoto","Yukihiro","Viktorovich",{git:"DadOfRuby",telegram:"RubyDad" })

a = student2.to_json
student4 = Student.from_json(a)
puts student4

student5 = Student.new("Плебеев", "Удел", "Таковский",{})

begin
  Student.from_json('Загон Шакалов Дикович')
rescue JSON::ParserError => e
  puts "#{e.message}"
end

begin
  Student.from_json('{"first_name": "Кирилл", "email":"kirillkirill@mail.ru"}')
rescue ArgumentError => e
  puts "#{e.message}"
end

puts student4.short_fio
puts student4.get_contact
puts student3.get_contact
puts student5.get_contact

puts student3.getInfo
puts student5.getInfo