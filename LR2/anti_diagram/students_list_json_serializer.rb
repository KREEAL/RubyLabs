
class StudentsListJsonSerializer < StudentsListSerializer

  public_class_method :new
  def serialize(file_path)
    students_list = self.students
    json_string = '{"ObjList":['
    students_list.each do |stud|
      json_string+=stud.to_json+","
    end
    json_string = json_string.chop + "]}"
    File.write(file_path,json_string)
  end
  def deserialize(file_path)
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



end