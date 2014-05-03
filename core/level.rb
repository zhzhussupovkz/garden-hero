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
    @stars = []
    @player = Player.new window, 600, 456
    generate_stars
  end

  #generate stars
  def generate_stars
    (25..275).step(50) do |i|
      @stars << Star.new(@window, 8, i)
    end

    (125..325).step(100) do |i|
      @stars << Star.new(@window, i, 56)
    end

    (175..325).step(75) do |i|
      @stars << Star.new(@window, i, 312)
    end

    (125..500).step(75) do |i|
      @stars << Star.new(@window, i, 456)
    end
  end

  #draw
  def draw
    @map.draw 0, 0, 0
    @stars.each do |s|
      s.draw
    end
    @player.draw
  end

  #update
  def update
    @player.move
  end

end
