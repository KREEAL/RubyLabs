require 'glimmer-dsl-libui'
class TabStudents
  include Glimmer::LibUI::CustomControl

  body {
    horizontal_box {
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
        @table = table {

          text_column('Фамилия И. О.')
          text_column('Гит')
          text_column('Контакт')

          editable false

          #тестовые данние
          cell_rows [['Сараев П. К.', 'podzhog_saraev', '+71111111111'], ['Жабов Б. Е.', nil, '@fffrog'], ['Ниту П. И.', 'nitupi', 'vvput@mail.ru'], ['Лобода Д. В.', nil, nil]]
        }

        @pages = horizontal_box {
          stretchy false

          button('1')
          button('2')
          button('3')
          label('...') { stretchy false }
          button('10')
        }
      }

      # Секция 3
      vertical_box {
        stretchy true

        button('Добавить') { stretchy false }
        button('Изменить') { stretchy false }
        button('Обновить') { stretchy false }
        button('Удалить')  { stretchy false }
      }
    }
  }
end