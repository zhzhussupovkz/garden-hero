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
  end
  
  def draw
    @bg.draw 0, 0, 0
  end
  
end
