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
    @game_over_ui = Gosu::Font.new(window, 'Monospace', 30)
    @stars, @apples = [], []
    @enemies = []
    @game_over = false
    @player = Player.new window, 600, 456
    generate_stars
    generate_apples
    generate_enemies
  end

  attr_reader :stars, :apples, :enemies
  attr_accessor :game_over

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

  #generate apples
  def generate_apples
    @apples << Apple.new(@window, 88, 175)
    @apples << Apple.new(@window, 376, 175)
    @apples << Apple.new(@window, 454, 56)
  end

  #generate enemies
  def generate_enemies
    @enemies << Enemy.new(@window, 8, 100, 'down')
    @enemies << Enemy.new(@window, 400, 55, 'right')
    @enemies << Enemy.new(@window, 376, 225, 'down')
    @enemies << Enemy.new(@window, 87, 225, 'down')
  end

  #draw
  def draw
    @map.draw 0, 0, 0
    @scoreboard.draw 0, 480, 0
    @stars.each do |s|
      s.draw
    end
    @apples.each do |a|
      a.draw
    end
    @enemies.each do |e|
      e.draw
    end
    @player.draw
    @ui.draw("Level #{@num}", 300, 484, 1)
    @game_over_ui.draw("GAME OVER", 240, 220, 2) if game_over
  end

  #update
  def update
    if game_over == false
      @player.move
      @enemies.each do |e|
        e.move
      end
    end
  end

end
