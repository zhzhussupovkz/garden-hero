=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Enemy - main enemy class
class Enemy

  def initialize window, x, y, face = 'right'
    @window, @x, @y, @face = window, x, y, face
    @left = Gosu::Image.new window, "images/enemy/enemy-left.png", false
    @right = Gosu::Image.new window, "images/enemy/enemy-right.png", false
    @up = Gosu::Image.new window, "images/enemy/enemy-up.png", false
    @down = Gosu::Image.new window, "images/enemy/enemy-down.png", false
  end

  attr_reader :window, :face

  #draw
  def draw
    case face
    when 'left'
      @left.draw(@x, @y, 1)
    when 'right'
      @right.draw(@x, @y, 1)
    when 'up'
      @up.draw(@x, @y, 1)
    when 'down'
      @down.draw(@x, @y, 1)
    end
  end

  def move_left
    @face = 'left'
    @x -= 2 if @x >= 2
  end

  def move_right
    @face = 'right'
    @x += 2 if @x <= 624
  end

  def move_up
    @face = 'up'
    @y -= 2 if @y >= 2
  end

  def move_down
    @face = 'down'
    @y += 2 if @y <= 460
  end
  
end
