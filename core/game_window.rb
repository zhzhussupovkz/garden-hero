=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#GameWindow - main window class
class GameWindow < Gosu::Window

  include Singleton

  def initialize
    super 640, 504, false
    self.caption = 'Garden Hero'
    begin
      @level = Level.new self
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :level

  #draw
  def draw
    @level.draw
  end

  #update
  def update
    @level.update
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end
end
