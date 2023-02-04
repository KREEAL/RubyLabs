require_relative 'student'


student1 = Student.new("Tsvetkov","Kirill","Alexandrovich",{telephone:"+79649265792"})
student2 = Student.new("Ivanov","Ivan","Ivanovich",{telegram:"VanyaPro",mail:"vanyavanyavanya@mail.ru",telephone:"+7964926582"})
student3 = Student.new("Matcumoto","Yukihiro","Viktorovich",{git:"DadOfRuby",telegram:"RubyDad" })
puts student1
puts "Valid?: #{student1.valid?}"
puts student2
puts "Valid?: #{student2.valid?}"
puts student3
puts "Valid?: #{student3.valid?}"

def test_invalid_fields(options)
  Student.new("Кинг","Мартин","Лютер",options)
rescue ArgumentError => e
  puts e.message
end

test_invalid_fields({ phone: '0000000' })
test_invalid_fields({ phone: 'samsung' })
test_invalid_fields({ phone: '+79649265792' })
test_invalid_fields({ mail: 'tsvetikov@mail' })
test_invalid_fields({ mail: 'tsvetikov@mail.ru' })
test_invalid_fields({ telegram: 'Webdev3000' })
test_invalid_fields({ telegram: 'Всем привет я тут новенький' })

student3.set_contacts({telegram:"vovapro",telephone:"+79999999900"})
puts student3
# student1.first_name="AnDrEw"