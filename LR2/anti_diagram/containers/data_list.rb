class DataList

  private_class_method :new

  attr_writer :objects_list

  def initialize(objects)
    self.objects_list = objects
    self.selected_objects = []
  end

  def select_by_number(number)
    selected_objects.append(number)
  end

  def get_selected
    return [] if self.selected_objects.length == 0
    selected_id_list = []
    selected_objects.each { |num|
      selected_id_list.append(objects_list[num].id)
    }
    selected_id_list
  end

  def clear_selected
    self.objects_list = []
  end

  #шаблон
  def get_data
    result = []
    count = 0
    objects_list.each { |object|
      row = []
      row<<count
      row.push(*get_fields_datatable(object))
      result<<row
      count+=1
    }
    DataTable.new(result)
  end

  protected
  def get_names
    raise NotImplementedError, 'You should implement get_names when extend DataList'
  end


  #это нужно переопределять в детях
  def get_fields_datatable(object)
    []
  end

  private
  attr_reader :objects_list
  attr_accessor  :selected_objects

end