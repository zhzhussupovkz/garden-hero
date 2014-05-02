=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Level - main game logic class
class Level

  def initialize window
    @window = window
    @num = 1
    @map = Gosu::Image.new window, "images/maps/level#{@num}.png", true
  end

  #draw
  def draw
    @map.draw 0, 0, 0
  end

end
