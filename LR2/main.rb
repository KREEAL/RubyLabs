require_relative 'student'


student1 = Student.new("Tsvetkov","Kirill","Alexandrovich",{telephone:"+79649265792"})
student2 = Student.new("Ivanov","Ivan","Ivanovich",{telegram:"VanyaPro",mail:"vanyavanyavanya@mail.ru",telephone:"+7964926582"})
student3 = Student.new("Matcumoto","Yukihiro","Viktorovich",{git:"DadOfRuby",telegram:"RubyDad" })

a = student2.to_json
student4 = Student.from_json(a)
puts student4