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
    @right_x, @left_x, @down_y, @up_y = @x + 50, @x - 50, @y + 50, @y - 50
  end

  attr_reader :window, :x, :y, :face, :right_x, :left_x, :up_y, :down_y

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

  #enemy's movement logic
  def move
    case face
    when 'right'
      @x += 0.5 if @x <= right_x
      @face = 'left' if @x == right_x
    when 'left'
      @x -= 0.5 if @x >= left_x
      @face = 'right' if @x == left_x
    when 'down'
      @y += 0.5 if @y <= down_y
      @face = 'up' if @y == down_y
    when 'up'
      @y -= 0.5 if @y >= up_y
      @face = 'down' if @y == up_y
    end
  end
  
end
