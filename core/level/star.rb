=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Star - star class (collect by player)
class Star

  def initialize window, x, y
    @window, @x, @y = window, x, y
    @img = Gosu::Image.new window, "images/player/star.png", true
  end

  attr_reader :x, :y
  
  def draw
    @img.draw(@x, @y, 1)
  end
  
end
