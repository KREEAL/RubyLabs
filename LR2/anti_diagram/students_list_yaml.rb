require_relative 'student'
require 'yaml'

class StudentsListYaml
  def initialize
    self.students = []
    self.gen_id = 1
  end
  #must be unporetected from parent?
  # def read_from_file(file_path)
  #   raise ArgumentError, "Путь к файлу указан неверно" unless File.exist?(file_path)
  #   badges = File.open(file_path, "r")
  #   doc = ""
  #   badges.each do |line|
  #     doc << line
  #   end
  #   badges.close
  #
  #   students_list = []
  #   objlist = JSON.parse(doc)
  #
  #   objlist["ObjList"].each do |obj|
  #     students_list << Student.from_json(obj.to_json)
  #   end
  #   self.students = students_list
  #   update_gen_id
  # end

  # def write_to_file(file_path)
  #   students_list = self.students
  #   json_string = '{"ObjList":['
  #   students_list.each do |stud|
  #     json_string+=stud.to_json+","
  #   end
  #   json_string = json_string.chop + "]}"
  #   File.write(file_path,json_string)
  # end

  def write_to_file(file_path)
    begin
      yaml_string = YAML.dump(self.students)
      File.open(file_path, 'w') {|f| f.write(yaml_string) }
    rescue StandardError => e
      puts "Error exporting students list: #{e.message}"
    end
  end

  def read_from_file(file_path)
    begin
      yaml_string = File.read(file_path)
      students = YAML.load(yaml_string)
      print students
      self.students = students
      update_gen_id
    rescue StandardError => e
      puts "Error exporting students list: #{e.message}"
    end
  end

  def get_by_id(object_id)
    students.detect{ |s| s.id == object_id }
  end

  def sort_students
    students.sort_by(&:short_fio)
  end

  def get_student_short_count
    students.count
  end

  def get_k_n_student_short_list(k,n,existing_short_data_list:nil)
    sliced_list = students[((k-1)*n),n].map{|s| StudentShort.from_student(s)}
    #собсна, если нам не дали даталист
    if existing_short_data_list.nil?
      return DataListStudentShort.new(sliced_list)
    end
    #если дали, то возвращаем его и плюс студентов из нашего списка
    existing_short_data_list.append(sliced_list)
  end

  def paginated_short_students(page, count, existing_data_list: nil)
    offset = (page - 1) * count
    slice = students[offset, count].map { |s| StudentShort.from_student(s) }

    return DataListStudentShort.new(slice) if existing_data_list.nil?

    existing_data_list.append(slice)
  end
  def add_student(student)
    student.id = gen_id
    self.students << student
    self.gen_id = gen_id+1
  end

  def replace_student(id_replaced,student)
    index_replaced = students.find_index { |s| s.id == id_replaced}
    if student.id.nil?
      student.id= self.gen_id
      update_gen_id
    end
    self.students[index_replaced] = student
  end

  def remove_student(id_removed)
    self.students.reject! { |s| s.id == id_removed }
  end
  #must be private?
  def update_gen_id
    self.gen_id = students.max_by(&:id).id + 1
  end


  attr_accessor :students, :gen_id

end