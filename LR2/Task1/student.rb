# frozen_string_literal: true

class Student
  @id = __id__
  @telephone = "+XXXXXXXXXXX"
  @telegram = "@example"
  @mail = "example@example.example"
  @git = "@example"
  def initialize (surname,name,dadname,telephone,telegram,mail,git)
    @surname = surname
    @name = name
    @dadname = dadname
  end

  attr_reader :name, :surname, :dadname,:id

  def to_s
    p @name + ' '+ @surname + ' ' + @id + ' '+ @telegram
  end
end

s1 = Student.new('a','b','c')