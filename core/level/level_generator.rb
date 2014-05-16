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

  #create main player
  def create_player
    Player.new @window, 600, 456
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
    end
    enemies
  end

end
