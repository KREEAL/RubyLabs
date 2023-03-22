require_relative 'student'
require_relative 'student_base'
require_relative 'student_short'
require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'
require_relative 'student_list_json'

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


# long_students = read_from_txt('./LR2/anti_diagram/students.txt')
#
# short_students = []
#
# long_students.each do |student|
#   short_students << StudentShort.from_student(student)
# end
#
#
# dlsh = DataListStudentShort.new(short_students)
#
#
#
# show_data_table(dlsh.get_data)
#
# dlsh.select_by_number(1)
# dlsh.select_by_number(2)
# dlsh.select_by_number(0)
# dlsh.select_by_number(0)
#
# puts dlsh.get_selected
# puts(long_students[0].to_json)



stljson = StudentsListJson.new
stljson.read_from_file("./LR2/anti_diagram/students.json")
print(stljson.students)
stljson.write_to_file("./LR2/anti_diagram/students2.json")

print("\n")
print(stljson.get_by_id(11))
print("\n")
print(stljson.sort_students)
print("\n")
print(stljson.get_student_short_count)


