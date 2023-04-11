require 'yaml'
require_relative 'models/student'
require_relative 'models/student_base'
require_relative 'models/student_short'
require_relative 'containers/data_table'
require_relative 'containers/data_list'
require_relative 'containers/data_list_student_short'
require_relative 'repositories/serializers/students_list_json_serializer'
require_relative 'repositories/serializers/students_list_yaml_serializer'
require_relative 'repositories/serializers/students_list_xml_serializer'
require_relative 'repositories/serializers/students_list_serializer'
require_relative 'repositories/data_sources/students_list_base'
require_relative 'repositories/adapters/db_source_adapter'
require_relative 'repositories/adapters/file_source_adapter'
require_relative 'repositories/students_repository'

require 'sqlite3'

#я знаю. Не клин фанкшн. Просто для проверки тут лежит
def show_data_table(datatable)
  (0..(datatable.rows_count-1)).each do |i|
    resultrow = []
    (0..(datatable.cols_count-1)).each do |j|
      resultrow << datatable.get_item(i,j).to_s
    end
    puts resultrow
  end
end

def test_repository(student_rep)
  puts "В репозитории #{student_rep.student_count} студентов."
  puts "Студент с id=1: #{student_rep.student_by_id(1)}"
  test_student = Student.new("Matcumotoo","Yukihiro","Viktorovich",{git:"DadOfRuby",telegram:"RubyDad",id:5})
  puts "Добавляем студента: #{test_student}"
  added_id = student_rep.add_student(test_student)
  puts "Добавили. Теперь студентов #{student_rep.student_count}. Его id: #{added_id}. Пробуем получить: "
  puts student_rep.student_by_id(added_id)
  test_student.telegram = 'new_telegram'
  puts test_student.telegram
  student_rep.replace_student(added_id, test_student)
  puts 'Заменяем телеграм студента...'
  student_rep.replace_student(added_id, test_student)
  puts student_rep.student_by_id(added_id)
  puts "Удаляем студента с id=#{added_id}..."
  student_rep.remove_student(added_id)
  puts "Удалили. Теперь студентов #{student_rep.student_count}"
  puts 'Тест k_n_students: '
  puts 'Страница 1:'
  puts student_rep.get_k_n_student_short_list(1, 3)
  puts 'Страница 2:'
  puts student_rep.get_k_n_student_short_list(2, 3)


end

puts
puts '=> Тест StudentRepository (JSON) <='
rep_json = StudentRepository.new(FileSourceAdapter.new(StudentsListJsonSerializer.new, 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\data_files\students.json'))
test_repository(rep_json)


puts
puts '=> Тест StudentRepository (DB) <='
rep_yaml = StudentRepository.new(DBSourceAdapter.new)
test_repository(rep_yaml)