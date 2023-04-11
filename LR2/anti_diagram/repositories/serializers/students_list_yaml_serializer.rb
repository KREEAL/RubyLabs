require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\models\student.rb'
require 'yaml'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\serializers\students_list_serializer.rb'

class StudentsListYamlSerializer < StudentsListSerializer

  public_class_method :new
  def serialize(file_path,students_given)
    begin
      yaml_string = YAML.dump(students_given)
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
      students
    rescue StandardError => e
      puts "Error exporting students list: #{e.message}"
    end
  end

end