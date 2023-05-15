require 'glimmer-dsl-libui'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\controllers\tab_students_controller.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\views\input_form_student.rb'

class TabStudents
  include Glimmer
  STUDENTS_PER_PAGE = 20
  def initialize
    @controller = TabStudentsController.new(self)
    @current_page = 1
    @total_count = 0
  end

  def on_create
    @controller.on_view_created
    @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
  end

  # Метод наблюдателя datalist
  def on_datalist_changed(new_table)
    arr = new_table.to_2d_array
    #arr.map { |row| row[3] = [row[3][:value], contact_color(row[3][:type])] }
    arr.map { |row| row[3] = [row[3][:value], puts(row[3][:type])] }
    @table.model_array = arr
  end

  def update_student_count(new_cnt)
    @total_count = new_cnt
    @page_label.text = "#{@current_page} / #{(@total_count / STUDENTS_PER_PAGE.to_f).ceil}"
  end

  def create
    root_container = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false
        form {
          stretchy false
          @filter_last_name_initials = entry {
            label 'Фамилия И. О.'
          }
          @filters = {}
          fields = [[:git, 'Гит'], [:mail, 'Почта'], [:telephone, 'Телефон'], [:telegram, 'Телеграм']]
          fields.each do |field|
            @filters[field[0]] = {}
            @filters[field[0]][:combobox] = combobox {
              label "#{field[1]} имеется?"
              items ['Не важно', 'Есть', 'Нет']
              selected 0
              on_selected do
                if @filters[field[0]][:combobox].selected == 1
                  @filters[field[0]][:entry].read_only = false
                else
                  @filters[field[0]][:entry].text = ''
                  @filters[field[0]][:entry].read_only = true
                end
              end
            }
            @filters[field[0]][:entry] = entry {
              label field[1]
              read_only true
            }
          end
        }
      }
      # Секция 2
      vertical_box {
        @table = refined_table(
          table_editable: false,
          table_columns: {
            '#' => :text,
            'Фамилия И. О' => :text,
            'Гит' => :text,
            'Контакт' => :text_color
          },
        per_page:STUDENTS_PER_PAGE
        )
        @pages = horizontal_box {
          stretchy false
          button("<") {
            stretchy true
            on_clicked do
              @current_page = [@current_page - 1, 1].max
              @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
            end
          }
          @page_label = label("...") { stretchy false }
          button(">") {
            stretchy true
            on_clicked do
              @current_page = [@current_page + 1, (@total_count / STUDENTS_PER_PAGE.to_f).ceil].min
              @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
            end
          }
        }
      }
      # Секция 3
      vertical_box {
        stretchy false
        button('Добавить') {
          stretchy false

          on_clicked {
            InputFormStudent.new.create.show
          }
        }
        button('Изменить') { stretchy false }
        button('Удалить') {
          stretchy false

          on_clicked {
            @controller.delete_selected(@current_page, STUDENTS_PER_PAGE, @table.selection) unless @table.selection.nil?
            @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
          }
        }
        button('Обновить') {
          stretchy false

          on_clicked {
            @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
          }
        }
      }
    }
    on_create
    root_container
  end
end