=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player - main player class
class Player

  def initialize window, x, y
    @window, @x, @y = window, x, y
    @face = 'left'
    @left = Gosu::Image.new window, "images/player/player-left.png", false
    @right = Gosu::Image.new window, "images/player/player-right.png", false
    @up = Gosu::Image.new window, "images/player/player-up.png", false
    @down = Gosu::Image.new window, "images/player/player-down.png", false
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

  #player movement logic
  def move
    move_left if window.button_down? Gosu::KbLeft
    move_right if window.button_down? Gosu::KbRight
    move_up if window.button_down? Gosu::KbUp
    move_down if window.button_down? Gosu::KbDown
  end

  def move_left
    @face = 'left'
    @x -= 2
  end

  def move_right
    @face = 'right'
    @x += 2
  end

  def move_up
    @face = 'up'
    @y -= 2
  end

  def move_down
    @face = 'down'
    @y += 2
  end
  
end