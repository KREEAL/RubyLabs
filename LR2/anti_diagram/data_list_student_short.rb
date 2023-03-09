# frozen_string_literal: true

require_relative 'data_table'
class DataListStudentShort < DataList
  public_class_method :new

  def initialize(objects)
    super(objects)
  end
  def get_names
    ["short_fio", "git", "contact"]
  end
  def get_data
    result = []
    count = 0
    objects_list.each { |object|
      row = []
      row<<count
      row<<object.short_fio
      row<<object.git
      row<<object.contact
      result<<row
      count+=1
    }
    DataTable.new(result)
  end

end