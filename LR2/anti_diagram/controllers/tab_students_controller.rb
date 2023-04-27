
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\views\main_window.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\students_repository.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\adapters\db_source_adapter.rb'

class TabStudentsController
  def initialize(view)
    @student_rep = StudentRepository.new(DBSourceAdapter.new)
    @view = view
  end

  def show_view
    @view.create.show
  end

  def refresh_data(page, per_page)
    @data_list = @student_rep.get_k_n_student_short_list(page, per_page)
  end
end