# frozen_string_literal: true

class Student

  def initialize (surname,name,dadname,telephone="+XXXXXXXXXXX",telegram="@example",mail="example@example.example",git="@example")
    @surname = surname
    @name = name
    @dadname = dadname
    @telephone = telephone
    @telegram = telegram
    @mail = mail
    @git = git
    @id = __id__
  end

  attr_accessor :name, :surname, :dadname,:telephone,:telegram,:mail,:git,:id

  #Я нашел как пишутся геттеры и сеттеры, не бейте пж за attr_accessor
  # def name
  #   @name
  # end
  #
  # def name=(value)
  #   @name = value
  # end


  def to_s
    @name + ' '+ @surname +  ' '+ @telegram
  end
end

s1 = Student.new('a','b','c',"+79649265792","@RetardKreeal")
