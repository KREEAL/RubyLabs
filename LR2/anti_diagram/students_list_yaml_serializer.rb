require_relative 'student'
require 'yaml'

class StudentsListYamlSerializer < StudentsListSerializer

  public_class_method :new
  def serialize(file_path)
    begin
      yaml_string = YAML.dump(self.students)
      File.open(file_path, 'w') {|f| f.write(yaml_string) }
    rescue StandardError => e
      puts "Error exporting students list: #{e.message}"
    end
  end

  def deserialize(file_path)
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

end