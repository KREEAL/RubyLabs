# frozen_string_literal: true
class Camera
  private_class_method :new
  def initialize
    ####
  end
  def get_a_photography
    make_photo
    print_photo
    pack_to_envelope
  end
  protected
  def make_photo
    puts "Нажать на большую кнопочку"
  end
  def print_photo
    ###
  end
  def pack_to_envelope
    puts "Запаковать фотографии в конверт"
  end
end
