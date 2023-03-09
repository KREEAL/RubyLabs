# frozen_string_literal: true
class DigitalCamera < Camera
  public_class_method :new


  protected
  def print_photo
    puts "Отправить на печать на принтер"
  end

end