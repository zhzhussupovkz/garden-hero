=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#LevelGenerator - create game environment for each level
class LevelGenerator

  def initialize num, window
    @num, @window = num, window
  end

  attr_reader :num

  #set player position
  def start_point player
    case num
    when 1
      player.start_point 600, 456
    when 2
      player.start_point 620, 168
    end
  end

  #generate stars 
  def generate_stars
    stars = []
    case num
    when 1
      (25..275).step(50) do |i|
        stars << Star.new(@window, 8, i)
      end

      (125..325).step(100) do |i|
        stars << Star.new(@window, i, 56)
      end

      (175..325).step(75) do |i|
        stars << Star.new(@window, i, 312)
      end

      (125..500).step(75) do |i|
        stars << Star.new(@window, i, 456)
      end

      (125..250).step(75) do |i|
        stars << Star.new(@window, 456, i)
      end
    when 2
      (100..175).step(50) do |i|
        stars << Star.new(@window, 72, i)
        stars << Star.new(@window, 296, i)
        stars << Star.new(@window, 552, i)
      end
      (120..475).step(50) do |i|
        stars << Star.new(@window, i, 440)
      end
      (256..332).step(50) do |i|
        stars << Star.new(@window, 296, i)
      end
    end
    stars
  end

  #generate apples
  def generate_apples
    apples = []
    case num
    when 1
      apples << Apple.new(@window, 88, 175)
      apples << Apple.new(@window, 376, 175)
      apples << Apple.new(@window, 454, 56)
    when 2
      apples << Apple.new(@window, 88, 388)
      apples << Apple.new(@window, 536, 388)
      apples << Apple.new(@window, 296, 224)
    end
    apples
  end
  
  #generate enemies
  def generate_enemies
    enemies = []
    case num
    when 1
      enemies << Enemy.new(@window, 8, 100, 'down')
      enemies << Enemy.new(@window, 400, 55, 'right')
      enemies << Enemy.new(@window, 376, 225, 'down')
      enemies << Enemy.new(@window, 87, 225, 'down')
    when 2
      enemies << Enemy.new(@window, 160, 167, 'right')
      enemies << Enemy.new(@window, 460, 167, 'right')
      enemies << Enemy.new(@window, 296, 372, 'down')
    end
    enemies
  end

end
