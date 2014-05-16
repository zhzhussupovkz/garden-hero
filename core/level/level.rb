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
    @generator = LevelGenerator.new @num, @window
    @player = @generator.create_player
    @stars = @generator.generate_stars
    @apples = @generator.generate_apples
    @enemies = @generator.generate_enemies
  end

  attr_reader :stars, :apples, :enemies, :num
  attr_accessor :game_over

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
