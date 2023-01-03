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
    grand_string = "#{@surname} #{@name} #{@dadname}"
    grand_string+= " #{@telephone}" if @telephone!="+XXXXXXXXXXX"
    grand_string+= " tg:#{@telegram}" if @telegram!="@example"
    grand_string+= " #{@mail}" if @mail!="example@example.example"
    grand_string+= " git:#{@git}" if @git!= "@example"
    grand_string
  end
end

s1 = Student.new('a','b','c',"+79649265792","@RetardKreeal")
