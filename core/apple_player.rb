=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#ApplePlayer - apple class (player's weapon)
class ApplePlayer

  def initialize window, player
    @window, @player, @x, @y = window, player, player.x - 6, player.y + 4
    @img = Gosu::Image.new window, "images/player/apple-player.png", true
    @drawing, @last_direction = false, 'left'
  end

  attr_reader :player
  attr_accessor :drawing, :x, :y, :last_direction

  #draw
  def draw
    @img.draw(@x, @y, 1) if @drawing
  end

  #update
  def update
    if @drawing
      case @last_direction
      when 'left'
        @x -= 5 if @x >= 2
      when 'right'
        @x += 5 if @x <= 632
      when 'up'
        @y -= 5 if @y >= 2
      when 'down'
        @y += 5 if @y <= 476
      end
      if @x <= 4 || @x >= 630 || @y <= 4 || @y >= 476
        @drawing = false
        @last_direction = player.face
      end
    end
  end

end
