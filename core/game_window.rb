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
      @menu = Menu.new self
      @pause, @win_game = true, false
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :level, :win_game
  attr_accessor :pause

  #draw
  def draw
    @menu.draw
    @level.draw if @menu.display === false
  end

  #update
  def update
    @menu.update if pause
    @level.update if not pause
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    when Gosu::KbP
      @pause = !@pause if @menu.display === false
    end
  end
end
