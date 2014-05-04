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
    @scoreboard = Gosu::Image.new window, "images/maps/scoreboard.png", true
    @ui = Gosu::Font.new(window, 'Monospace', 20)
    @stars = []
    @enemies = []
    @player = Player.new window, 600, 456
    generate_stars
    generate_enemies
  end

  attr_reader :stars

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

    (125..250).step(75) do |i|
      @stars << Star.new(@window, 456, i)
    end
  end

  #generate enemies
  def generate_enemies
    @enemies << Enemy.new(@window, 8, 100, 'down')
    @enemies << Enemy.new(@window, 400, 55, 'right')
    @enemies << Enemy.new(@window, 376, 200, 'down')
    @enemies << Enemy.new(@window, 87, 200, 'down')
  end

  #draw
  def draw
    @map.draw 0, 0, 0
    @scoreboard.draw 0, 480, 0
    @stars.each do |s|
      s.draw
    end
    @enemies.each do |e|
      e.draw
    end
    @player.draw
    @ui.draw("Level #{@num}", 300, 484, 1)
  end

  #update
  def update
    @player.move
  end

end
