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
    @face, @score, @stars, @lives = 'left', 0, 0, 3
    @left = Gosu::Image.new window, "images/player/player-left.png", false
    @right = Gosu::Image.new window, "images/player/player-right.png", false
    @up = Gosu::Image.new window, "images/player/player-up.png", false
    @down = Gosu::Image.new window, "images/player/player-down.png", false
    @ui_star = Gosu::Image.new window, "images/player/star.png", true
    @ui_lives = Gosu::Image.new window, "images/player/heart.png", true
    @ui = Gosu::Font.new(window, 'Monospace', 20)
  end

  attr_reader :window, :face, :x, :y

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
    @ui_star.draw(8, 484, 1)
    size = 16
    @lives.times do
      @ui_lives.draw(632 - size, 484, 1)
      size += 16
    end
    @ui.draw("#{@stars}", 24, 484, 1)
    @ui.draw("#{@score}", 572 - (Math.log10(@score + 1).to_i) * 8, 483.5, 1)
  end

  #player movement logic
  def move
    if @lives > 0
      move_left if window.button_down? Gosu::KbLeft
      move_right if window.button_down? Gosu::KbRight
      move_up if window.button_down? Gosu::KbUp
      move_down if window.button_down? Gosu::KbDown
      collect_stars
      collect_apples
    else
      window.level.game_over = true
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

  #collect stars by player
  def collect_stars
    window.level.stars.each do |s|
      if (x - s.x).abs <= 8 && (y - s.y).abs <= 8
        add_stars_score
      end
    end
    window.level.stars.reject! do |s|
      (x - s.x).abs <= 8 && (y - s.y).abs <= 8
    end
  end

  #collect apples by player
  def collect_apples
    window.level.apples.each do |a|
      if (x - a.x).abs <= 8 && (y - a.y).abs <= 8
        add_apples_score
      end
    end
    window.level.apples.reject! do |a|
      (x - a.x).abs <= 8 && (y - a.y).abs <= 8
    end
  end

  #add score when collect stars by player
  def add_stars_score
    @score += 10
    @stars += 1
  end

  #add score when collect apples by player
  def add_apples_score
    @score += 50
    @lives += 1 if @lives < 3
  end
  
end
