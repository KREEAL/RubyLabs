class DataList

  private_class_method :new


  def initialize(objects)
    self.objects_list = objects
    self.selected_objects = []
  end

  def select_by_number(number)
    selected_objects.append(number)
  end

  def get_selected
    selected_id_list = []
    selected_objects.each { |num|
      selected_id_list.append(objects_list[num].id)
    }
    selected_id_list
  end

  def clear_selected
    self.objects_list = []
  end

  protected
  def get_names
    raise NotImplementedError, 'You should implement get_names when extend DataList'
  end

  def get_data
    raise NotImplementedError, 'You should implement get_data when extend DataList'
  end


  private
  attr_accessor :objects_list, :selected_objects

end