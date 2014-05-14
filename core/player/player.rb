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
    @weapon = ApplePlayer.new window, self
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
    @weapon.draw
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
      walk_on_horizontal_roads
      walk_on_vertical_roads
      collect_stars
      collect_apples
      attack if window.button_down? Gosu::KbSpace
    else
      window.level.game_over = true
    end
    @weapon.update
    add_injury_to_enemies
  end

  #player walking on horizontal roads
  def walk_on_horizontal_roads
    if (x >= 82 && x <= 604 && y >= 448 && y <= 460)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 90
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 600
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 453
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 454
      end
    end

    if (x >= 4 && x <= 604 && y >= 306 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 8
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 600
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 308
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 4 && x <= 462 && y >= 44 && y <= 56)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 8
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 458
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 52
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 53
      end
    end
  end


  #player walking on vertical roads
  def walk_on_vertical_roads
    if (x >= 590 && x <= 602 && y >= 312 && y <= 460)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 598
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 600
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 316
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 454
      end
    end

    if (x >= 546 && x <= 560 && y >= 220 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 550
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 554
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 222
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 448 && x <= 460 && y >= 50 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 454
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 458
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 56
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 368 && x <= 380 && y >= 160 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 374
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 376
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 164
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 80 && x <= 96 && y >= 160 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 86
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 88
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 164
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 4 && x <= 16 && y >= 4 && y <= 314)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 8
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 9
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 6
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 310
      end
    end

    if (x >= 82 && x <= 92 && y >= 428 && y <= 460)
      if window.button_down? Gosu::KbLeft
        move_left if @x >= 88
      end
      if window.button_down? Gosu::KbRight
        move_right if @x <= 90
      end
      if window.button_down? Gosu::KbUp
        move_up if @y >= 430
      end
      if window.button_down? Gosu::KbDown
        move_down if @y <= 454
      end
    end
  end


  def move_left
    @face = 'left'
    @weapon.last_direction = 'left' if @weapon.drawing == false
    @x -= 2
  end

  def move_right
    @face = 'right'
    @weapon.last_direction = 'right' if @weapon.drawing == false
    @x += 2
  end

  def move_up
    @face = 'up'
    @weapon.last_direction = 'up' if @weapon.drawing == false
    @y -= 2
  end

  def move_down
    @face = 'down'
    @weapon.last_direction = 'down' if @weapon.drawing == false
    @y += 2
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

  #add score when kill enemies
  def add_enemies_score
    @score += 75
  end

  #attack enemies
  def attack
    if @weapon.drawing == false
      case face
      when 'left'
        @weapon.x, @weapon.y = x - 4, y + 4
      when 'right'
        @weapon.x, @weapon.y = x + 12, y + 4
      when 'up'
        @weapon.x, @weapon.y = x + 4, y - 8
      when 'down'
        @weapon.x, @weapon.y = x + 4, y + 16
      end
    end
    @weapon.drawing = true
  end

  #add injury to enemies
  def add_injury_to_enemies
    window.level.enemies.each do |e|
      if Gosu::distance(e.x, e.y, @weapon.x, @weapon.y) <= 8
        @weapon.drawing = false
        add_enemies_score
      end
    end
    window.level.enemies.reject! do |e|
      Gosu::distance(e.x, e.y, @weapon.x, @weapon.y) <= 8
    end
  end
  
end
