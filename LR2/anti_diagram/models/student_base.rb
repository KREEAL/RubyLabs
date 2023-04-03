require 'json'
class StudentBase
  #необходимо для того, чтобы студентбазе был абстрактным классом
  private_class_method :new

  public
  #Стандартный конструктор
  def initialize(options)
    self.id = options[:id]
    self.telephone = options[:telephone]
    self.telegram = options[:telegram]
    self.mail = options[:mail]
    self.git = options[:git]
  end


  #Валидаторы полей
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

  def self.valid_mail?(mail)
    mail.match(/^(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/)
  end

  #Первый нениловый контакт
  def get_contact
    contact = {}
    [:telephone, :telegram, :mail].each do |attr|
      attr_val = send(attr)
      next if attr_val.nil?

      contact[:type] = attr
      contact[:value] = attr_val
      return contact
    end
    nil
  end

  #валидации по всяким гитам и контактам
  def has_git?
    !git.nil?
  end
  def has_contacts?
    !telephone.nil?|| !telegram.nil? || !mail.nil?
  end
  def valid?
    valid_contacts? && valid_git?
  end

  attr_reader :id, :git

  protected
  attr_writer :id
  attr_reader :telephone, :telegram, :mail


  # protected
  #Сеттеры с проверками
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
    @mail = new_mail
  end


end
