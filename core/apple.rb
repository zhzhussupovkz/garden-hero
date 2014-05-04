=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Apple - apple class (collect by player)
class Apple

  def initialize window, x, y
    @window, @x, @y = window, x, y
    @img = Gosu::Image.new window, "images/player/apple.png", true
  end

  attr_reader :x, :y
  
  def draw
    @img.draw(@x, @y, 1)
  end
  
end
