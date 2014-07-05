=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player - main player class
class Player

  def initialize window
    @window, @x, @y = window, 600, 456
    @face, @score, @stars, @lives = 'left', 0, 0, 3
    @stamina = 100
    @left = Gosu::Image.new window, "images/player/player-left.png", false
    @right = Gosu::Image.new window, "images/player/player-right.png", false
    @up = Gosu::Image.new window, "images/player/player-up.png", false
    @down = Gosu::Image.new window, "images/player/player-down.png", false
    @ui_star = Gosu::Image.new window, "images/player/star.png", true
    @ui_lives = Gosu::Image.new window, "images/player/heart.png", true
    @collect = Gosu::Song.new(window, "sounds/player/collect.ogg")
    @collect_apples = Gosu::Song.new(window, "sounds/player/collect_apples.ogg")
    @win_song = Gosu::Song.new(window, "sounds/level/win.ogg")
    @weapon = ApplePlayer.new window, self
    @ui = Gosu::Font.new(window, 'Monospace', 20)
  end

  attr_reader :window, :face, :x, :y, :score

  #set player coordinates in new level
  def start_point x, y
    @x, @y = x, y
  end

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
      if @stars == 36
        @window.win_game = true
        @win_song.play
        @window.total_score += score
        @stars = 0
      end
    else
      window.level.game_over = true
    end
    @weapon.update
    add_injury_to_enemies
  end

  #player walking on horizontal roads
  def walk_on_horizontal_roads
    case window.level.num
    when 1
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
    when 2
      if (x >= 4 && x <= 632 && y >= 160 && y <= 168)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 8
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 628
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 164
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 165
        end
      end

      if (x >= 82 && x <= 536 && y >= 436 && y <= 440)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 88
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 532
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 438
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 438
        end
      end
    end
  end


  #player walking on vertical roads
  def walk_on_vertical_roads
    case window.level.num
    when 1
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
    when 2
      if (x >= 550 && x <= 556 && y >= 94 && y <= 168)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 552
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 553
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 98
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 164
        end
      end

      if (x >= 294 && x <= 298 && y >= 94 && y <= 440)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 296
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 297
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 98
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 436
        end
      end

      if (x >= 70 && x <= 74 && y >= 94 && y <= 168)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 72
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 73
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 98
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 164
        end
      end

      if (x >= 84 && x <= 90 && y >= 376 && y <= 444)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 88
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 89
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 382
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 438
        end
      end

      if (x >= 532 && x <= 538 && y >= 376 && y <= 444)
        if window.button_down? Gosu::KbLeft
          move_left if @x >= 535
        end
        if window.button_down? Gosu::KbRight
          move_right if @x <= 536
        end
        if window.button_down? Gosu::KbUp
          move_up if @y >= 382
        end
        if window.button_down? Gosu::KbDown
          move_down if @y <= 438
        end
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
        @collect.play(looping = false)
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
        @collect_apples.play(looping = false)
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

  #add injury when enemies attack
  def add_injury
    case face
    when 'left'
      @x += 4
    when 'right'
      @x -= 4
    when 'up'
      @y += 4
    when 'down'
      @y -= 4
    end
    @stamina -= 5
    if @stamina <= 0
      @stamina = 0
      reboot
    end
  end

  #add injury to enemies
  def add_injury_to_enemies
    window.level.enemies.each do |e|
      if Gosu::distance(e.x, e.y, @weapon.x, @weapon.y) <= 8
        @weapon.drawing = false
        add_enemies_score
      end
      if Gosu::distance(e.x, e.y, x, y) <= 8
        add_injury
      end
    end
    window.level.enemies.reject! do |e|
      Gosu::distance(e.x, e.y, @weapon.x, @weapon.y) <= 8
    end
  end

  #reboot player 
  def reboot
    case window.level.num
    when 1
      start_point 600, 456
    when 2
      start_point 620, 168
    end
    @lives -= 1
    @stamina = 100
  end
  
end
