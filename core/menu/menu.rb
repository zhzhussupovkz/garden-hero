=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Menu - main menu class
class Menu

  def initialize window
    @window, @display = window, true
    @bg = Gosu::Image.new window, 'images/menu/menu.png', true
    @cursor = Gosu::Image.new window, 'images/menu/cursor.png'
    @copyright = Gosu::Font.new window, 'Monospace', 20
  end

  attr_accessor :display

  def draw
    if display
      @bg.draw 0, 0, 0
      @cursor.draw @window.mouse_x, @window.mouse_y, 2
      year = (Time.at(Time.now.to_i)).strftime("%Y")
      @copyright.draw("Copyright (c) #{year} by zhzhussupovkz", 175, 475, 1)
    end
  end

  def update
    if 270 < @window.mouse_x &&
    @window.mouse_x < 366 &&
    240 < @window.mouse_y &&
    @window.mouse_y < 272 && (@window.button_down? Gosu::MsLeft)
      new_game
    end
  end

  #new game button click event
  def new_game
    @display = false
    @window.pause = false
  end

end
