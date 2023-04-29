# frozen_string_literal: true

require_relative 'data_table'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\containers\data_list.rb'
class DataListStudentShort < DataList
  public_class_method :new

  def initialize(objects)
    super(objects)
  end
  def get_names
    ["short_fio", "git", "contact"]
  end

  protected
  def get_fields_datatable(object)
    [object.short_fio, object.git, object.get_contact]
  end

end