
class StudentsListJson < StudentsListBase
  def initialize
    super
  end
  #must be unporetected from parent?
  def read_from_file(file_path)
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
    self.students = students_list
    update_gen_id
  end

  def write_to_file(file_path)
    students_list = self.students
    json_string = '{"ObjList":['
    students_list.each do |stud|
      json_string+=stud.to_json+","
    end
    json_string = json_string.chop + "]}"
    File.write(file_path,json_string)
  end

end