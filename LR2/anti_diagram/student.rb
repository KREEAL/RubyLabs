# frozen_string_literal: false

require 'json'
require_relative 'student_base'
class Student < StudentBase
  #снимает блокировку абстрактности от родителя
  public_class_method :new
  def initialize(last_name, first_name, dadname, options)
    self.last_name = last_name
    self.first_name = first_name
    self.dadname = dadname
    super(options)
  end

  def self.from_json (json_str)
    #Если что-то не так с json, то ведь он и сам ошибку выкинет
    parsed = JSON.parse(json_str)

    raise ArgumentError, 'Заполните все необходимые поля' unless parsed.key?('last_name') && parsed.key?('first_name') && parsed.key?('dadname')

    last_name = parsed['last_name']
    first_name = parsed['first_name']
    dadname = parsed['dadname']

    Student.new(last_name,first_name,dadname,parsed.transform_keys(&:to_sym))
  end


  # Распривачиваем все, что запривачено
  public :telephone, :telegram, :mail, 'id=', 'telephone=', 'telegram=', 'mail=', 'git='

  attr_reader :last_name, :first_name, :dadname



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
    @dadname = new_dadname
  end

  #поставить контакты
  def set_contacts(options)
    self.telephone = options[:telephone] if options.key?(:telephone)
    self.telegram = options[:telegram] if options.key?(:telegram)
    self.mail = options[:mail] if options.key?(:mail)
  end

  #Фамилия и инициалы
  def short_fio
    "#{last_name} #{first_name[0]}. #{dadname[0]}."
  end

  #Краткая информация о студенте
  def getInfo
    git_str = ", Git: #{git}."
    git_str = "" if git.nil?
    "#{short_fio}, #{get_contact}" + git_str
  end

  #информация для создания student_short объекта просто из student
  def info_short
    info_sh = {}
    info_sh[:short_fio] = short_fio
    info_sh[:contact] = get_contact
    info_sh[:git] = git
    JSON.generate(info_sh)
  end

  def self.read_from_txt(file_path)
    #что-то мне подсказывает, что это не клин фанкшн
    raise ArgumentError, "Путь к файлу указан неверно" unless File.exist?(file_path)
    badges = File.open(file_path, "r")
    doc = ""
    badges.each do |line|
      doc << line
    end
    badges.close

    students_list = []
    objlist = JSON.parse(doc)

    objlist["ObjList"].each do |obj|
      students_list << from_json(obj.to_json)
    end
    students_list
  end

  #в json строку
  def to_json
    attribs = {}
    fields =  [:last_name, :first_name, :dadname, :telephone, :telegram, :mail, :git, :id]
    fields.each do |attr|
      attrib_val = send(attr.to_sym)
      attribs[attr] = attrib_val unless attrib_val.nil?
    end
    JSON.generate(attribs)
  end
  #в строку
  def to_s
    grand_string = "#{@last_name} #{@first_name} #{@dadname}"
    grand_string += " #{@telephone}" unless @telephone.nil?
    grand_string += " tg:#{@telegram}" unless @telegram.nil?
    grand_string += " #{@mail}" unless @mail.nil?
    grand_string += " git:#{@git}" unless @git.nil?
    grand_string
  end

end

