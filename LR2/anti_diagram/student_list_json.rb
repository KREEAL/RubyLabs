
class StudentsListJson
  def initialize
    self.students = []
  end

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

  def get_by_id(object_id)
    students.detect{ |s| s.id == object_id }
  end

  def sort_students
    students.sort_by(&:short_fio)
    #Или нужно брать фамилию, целпять имя и по этому уже сортировать? Нененен
  end

  def get_student_short_count
    students.count
  end


  attr_accessor :students

end