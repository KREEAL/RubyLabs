# frozen_string_literal: true
require 'json'
require_relative 'student_base'
class StudentShort < StudentBase
  #снимает блокировку абстрактности от родителя
  public_class_method :new

  private
  attr_writer :short_fio
  # attr_accessor :contact

  public
  attr_reader :short_fio

  #Создание короткого студента из не короткого
  def self.from_student(student)
    StudentShort.new(student.id, student.info_short)
  end

  def initialize(id, info_short)
    shorts = JSON.parse(info_short).transform_keys(&:to_sym)
    raise ArgumentError, 'Нет всей информации' if  !shorts.key?(:contact) || shorts[:contact].nil?  ||  !shorts.key?(:short_fio) || shorts[:short_fio].nil?
    self.id = id
    self.short_fio = shorts[:short_fio]
    #self.contact = shorts[:contact].transform_keys(&:to_sym)
    self.git = shorts[:git]
    options = {}
    options[:id] = id
    options[:git] = git
    #
    contact = shorts[:contact].transform_keys(&:to_sym)
    #
    options[contact[:type].to_sym] = contact[:value]
    super(options)
  end

  def to_s
    grand_string = "#{short_fio}"
    grand_string += " git:#{git}" unless git.nil?
    contact = get_contact
    grand_string += " #{contact[:type]}:#{contact[:value]}" unless contact.nil?
    grand_string
  end
end