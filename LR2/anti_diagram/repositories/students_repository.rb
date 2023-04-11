
class StudentRepository
  def initialize(data_source_adapter)
    @data_source_adapter = data_source_adapter
  end

  def student_by_id(student_id)
    @data_source_adapter.get_by_id(student_id)
  end

  # Получить page по счету count элементов (страница начинается с 1)
  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    @data_source_adapter.get_k_n_student_short_list(k, n, existing_data_list)
  end

  def add_student(student)
    @data_source_adapter.add_student(student)
  end

  def replace_student(student_id, student)
    @data_source_adapter.replace_student(student_id, student)
  end

  def remove_student(student_id)
    @data_source_adapter.remove_student(student_id)
  end

  def student_count
    @data_source_adapter.get_student_short_count
  end
end