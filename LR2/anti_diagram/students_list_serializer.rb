class StudentsListSerializer
  private_class_method :new
  def serialize(file_path,students_given)
    raise NotImplementedError, "You must implement the serialize method"
  end

  def deserialize(file_path)
    raise NotImplementedError, "You must implement the deserialize method"
  end
end