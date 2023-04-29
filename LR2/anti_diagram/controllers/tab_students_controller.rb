
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\views\main_window.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\students_repository.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\adapters\db_source_adapter.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\containers\data_list_student_short.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\adapters\file_source_adapter.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\serializers\students_list_json_serializer.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\students_repository.rb'
require 'win32api'

class TabStudentsController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_listener(@view)
  end

  def on_view_created
    @student_rep = StudentRepository.new(DBSourceAdapter.new)
  end

  def show_view
    @view.create.show
  end

  def refresh_data(page, per_page)
    begin
      #raise StandardError, "Error DB"
      @data_list = @student_rep.get_k_n_student_short_list(page, per_page, @data_list)
      @view.update_student_count(@student_rep.student_count)
    rescue
      on_db_connection_error
    end

  end

  def on_db_connection_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    exit(false)
  end
end