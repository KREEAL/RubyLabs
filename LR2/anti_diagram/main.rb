require_relative 'student'
require_relative 'student_base'
require_relative 'student_short'
require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'


def self.read_from_txt(file_path)
  raise ArgumentError, "Путь к файлу указан неверно" unless File.exist?(file_path)
  badges = File.open(file_path, "r")
  doc = ""
  badges.each do |line|
    doc << line
  end
  badges.close

  students_list = []
  objlist = JSON.parse(doc)

  objlist["ObjList"].each do |obj|
    students_list << Student.from_json(obj.to_json)
  end
  students_list
end

def self.write_to_txt(students_list,file_path)
  json_string = '{"ObjList":['
  students_list.each do |stud|
    json_string+=stud.to_json+","
  end
  json_string = json_string.chop + "]}"
  File.write(file_path,json_string)
end

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


long_students = read_from_txt('./LR2/anti_diagram/students.txt')

short_students = []

long_students.each do |student|
  short_students << StudentShort.from_student(student)
end


dlsh = DataListStudentShort.new(short_students)



show_data_table(dlsh.get_data)

dlsh.select_by_number(1)
dlsh.select_by_number(2)
dlsh.select_by_number(0)
dlsh.select_by_number(0)

puts dlsh.get_selected


puts(long_students[0].to_json)

