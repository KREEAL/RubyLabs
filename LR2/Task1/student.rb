# frozen_string_literal: true

class Student
  def initialize(surname,name,dadname,options)
      self.surname = surname
      self.name = name
      self.dadname = dadname

      self.telephone = options[:telephone]
      self.telegram = options[:telegram]
      self.mail = options[:mail]
      self.git = options[:git]
      self.id = options[:id]
  end

  attr_accessor :name, :surname, :dadname,:telegram,:mail,:git,:id
  attr_reader :telephone

  def self.telephone_number?(number)
    return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
    false
  end

  def telephone=(new_telephone)
    raise ArgumentError, "Invalid argument: telephone=#{new_telephone}" unless new_telephone.nil? || Student.telephone_number?(new_telephone)
    @telephone = new_phone
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

