require_relative 'serializers/rs/students_list_serializer'
class StudentsListBase

  def initialize(serializer)
    self.students = []
    self.serializer = serializer
    self.gen_id = 1
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

  def read_from_file(file_path)
    self.students = serializer.deserialize(file_path)
    update_gen_id
  end
  def write_to_file(file_path,students_given)
    serializer.serialize(file_path,students_given)
  end

  attr_accessor :students
  attr_writer :serializer


  protected


  attr_accessor :gen_id
  attr_reader :serializer
  private
  def update_gen_id
    self.gen_id = students.max_by(&:id).id + 1
  end
end