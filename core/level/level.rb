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
    @game_over = false
    @player = Player.new window
    @generator = LevelGenerator.new @num, @window
    @generator.start_point @player
    @stars = @generator.generate_stars
    @apples = @generator.generate_apples
    @enemies = @generator.generate_enemies
  end

  attr_reader :stars, :apples, :enemies, :num
  attr_accessor :game_over

  #go next level
  def go_next_level
    @num += 1
    @map = Gosu::Image.new @window, "images/maps/level#{@num}.png", true
    @generator = LevelGenerator.new @num, @window
    @generator.start_point @player
    @stars = @generator.generate_stars
    @apples = @generator.generate_apples
    @enemies = @generator.generate_enemies
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
      go_next_level if stars.empty?
    end
  end

end
