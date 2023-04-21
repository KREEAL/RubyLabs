
require 'glimmer-dsl-libui'
require_relative 'tab_students'

class MainWindow
  include Glimmer
  def create
    window('Университет', 1000, 600) {
      tab {
        tab_item('Студенты') {
          tab_students
        }

        tab_item('Вкладка 2') { }
        tab_item('Вкладка 3') { }
      }
    }
  end
end