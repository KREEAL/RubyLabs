# frozen_string_literal: true

class Student
  def initialize(surname,name,dadname,options)
      @surname = surname
      @name = name
      @dadname = dadname


      @telegram = options[:telegram]
      @mail = options[:mail]
      @git = options[:git]
      @id = options[:id]
  end

  attr_accessor :name, :surname, :dadname,:telephone,:telegram,:mail,:git,:id

  def self.telephone_number?(number)
    return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
    false
  end


  def to_s
    grand_string = "#{@surname} #{@name} #{@dadname}"
    grand_string += " #{@telephone}" unless @telephone.nil?
    grand_string+= " tg:#{@telegram}" unless @telegram.nil?
    grand_string+= " #{@mail}" unless @mail.nil?
    grand_string+= " git:#{@git}" unless @git.nil?
    grand_string
  end
end

