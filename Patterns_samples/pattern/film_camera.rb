# frozen_string_literal: true
class FilmCamera < Camera
  public_class_method :new

  protected
  def print_photo
    puts "Проявить фото при красном свете"
  end

end

