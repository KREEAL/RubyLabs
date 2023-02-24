# frozen_string_literal: true

class Student
  def initialize(last_name,first_name,dadname,options)
      self.last_name = last_name
      self.first_name = first_name
      self.dadname = dadname

      self.telephone = options[:telephone]
      self.telegram = options[:telegram]
      self.mail = options[:mail]
      self.git = options[:git]
      self.id = options[:id]
  end


  attr_accessor :id
  attr_reader :last_name, :first_name, :dadname, :telephone, :telegram, :mail, :git



  #Общая проверка на ФИО
  def self.valid_name?(name)
    name.match(/(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/)
  end
  #Общая проверка на имена тг/гита и тд
  def self.valid_profile_name?(profile_name)
    profile_name.match(/^[a-zA-Z0-9_.]+$/)
  end
  def self.valid_telephone?(number)
    return true unless (number =~ /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/).nil?
    false
  end

  def self.valid_mail?(email)
    email.match(/^(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/)
  end

  def last_name=(new_last_name)
    raise ArgumentError, "Invalid argument: last_name=#{new_last_name}" unless Student.valid_name?(new_last_name)
    @last_name = new_last_name
  end

  def first_name=(new_first_name)
    raise ArgumentError, "Invalid argument: first_name=#{new_first_name}" unless Student.valid_name?(new_first_name)
    @first_name = new_first_name
  end

  def dadname=(new_dadname)
    raise ArgumentError, "Invalid argument: dadname=#{new_dadname}" unless Student.valid_name?(new_dadname)
    @father_name = new_dadname
  end

  def telephone=(new_telephone)
    raise ArgumentError, "Invalid argument: telephone=#{new_telephone}" unless new_telephone.nil? || Student.valid_telephone?(new_telephone)
    @telephone = new_telephone
  end

  def telegram=(new_telegram)
    raise ArgumentError, "Invalid argument: telegram=#{new_telegram}" unless new_telegram.nil? || Student.valid_profile_name?(new_telegram)
    @telegram = new_telegram
  end

  def git=(new_git)
    raise ArgumentError, "Invalid argument: git=#{new_git}" unless new_git.nil? || Student.valid_profile_name?(new_git)
    @git = new_git
  end

  def mail=(new_mail)
    raise ArgumentError, "Invalid argument: email=#{new_mail}" unless new_mail.nil? || Student.valid_mail?(new_mail)
    @email = new_mail
  end

  def valid_git?
    !git.nil?
  end
  def valid_contacts?
    !telephone.nil?|| !telegram.nil? || !mail.nil?
  end

  #валидность по наличию контактов или гита
  def valid?
    valid_contacts? && valid_git?
  end


  def set_contacts(options)
    self.telephone = options[:telephone] if options.key?(:telephone)
    self.telegram = options[:telegram] if options.key?(:telegram)
    self.mail = options[:mail] if options.key?(:mail)
  end
  def to_s
    grand_string = "#{@last_name} #{@first_name} #{@dadname}"
    grand_string += " #{@telephone}" unless @telephone.nil?
    grand_string += " tg:#{@telegram}" unless @telegram.nil?
    grand_string += " #{@mail}" unless @mail.nil?
    grand_string += " git:#{@git}" unless @git.nil?
    grand_string
  end
end

