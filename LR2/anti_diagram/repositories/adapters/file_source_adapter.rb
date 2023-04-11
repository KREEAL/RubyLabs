
class FileSourceAdapter
  def initialize(data_transformer, file_path)
    @file_path = file_path
    @file_source = StudentsListBase.new(data_transformer)
    @file_source.read_from_file(file_path)
  end

  def get_by_id(student_id)
    @file_source.get_by_id(student_id)
  end

  def get_k_n_student_short_list(k, n, existing_data_list=nil)
    @file_source.get_k_n_student_short_list(k, n, existing_data_list)
  end

  def add_student(student)
    added_id = @file_source.add_student(student)
    @file_source.write_to_file(@file_path,@file_source.students)
    added_id
  end

  def replace_student(student_id, student)
    @file_source.replace_student(student_id, student)
    @file_source.write_to_file(@file_path,@file_source.students)
  end

  def remove_student(student_id)
    @file_source.remove_student(student_id)
    @file_source.write_to_file(@file_path,@file_source.students)
  end

  def get_student_short_count
    @file_source.get_student_short_count
  end
end