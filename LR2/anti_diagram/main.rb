require_relative 'student'
require_relative 'student_base'
require_relative 'student_short'
require_relative 'data_table'


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
    students_list << from_json(obj.to_json)
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


data_test = [[1, 'A', [true,true,true]], [0, 'B']]
data_table = DataTable.new(data_test)
puts data_table.get_item(0, 2)
puts data_table.rows_count
puts data_table.cols_count

