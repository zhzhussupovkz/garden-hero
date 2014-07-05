=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Menu - main menu class
class Menu

  def initialize window
    @window, @display, @show_controls = window, true, false
    @bg = Gosu::Image.new window, 'images/menu/menu.png', true
    @cursor = Gosu::Image.new window, 'images/menu/cursor.png'
    @controls = Gosu::Image.new window, 'images/menu/controls.png'
    @copyright = Gosu::Font.new window, 'Monospace', 20
    @ctrl = Gosu::Font.new window, 'Monospace', 16
    @collect = Gosu::Image.new window, 'images/menu/collect.png'
    @enemy = Gosu::Image.new window, 'images/menu/enemy.png'
  end

  attr_accessor :display

  def draw
    if display
      @bg.draw 0, 0, 0
      @cursor.draw @window.mouse_x, @window.mouse_y, 4
      year = (Time.at(Time.now.to_i)).strftime("%Y")
      @copyright.draw("Copyright (c) #{year} by zhzhussupovkz", 175, 450, 1)
      @copyright.draw("Music by Super Mario Bros.", 220, 475, 1)
      if @show_controls
        @controls.draw(200, 208, 2)
        @ctrl.draw("CONTROLS", 300, 216, 3)
        @ctrl.draw("Movement:", 240, 240, 3)
        @ctrl.draw("Fire:", 240, 264, 3)
        @ctrl.draw("Pause:", 240, 288, 3)
        @ctrl.draw("Collect ", 240, 324, 3)
        @collect.draw(336, 322, 3)
        @ctrl.draw("Kill ", 240, 348, 3)
        @enemy.draw(336, 346, 3)
        @ctrl.draw("Arrows", 336, 240, 3)
        @ctrl.draw("Space", 336, 264, 3)
        @ctrl.draw("P", 336, 288, 3)
        @ctrl.draw("Press SPACE to go to the menu", 224, 386, 3)
      end
      if @window.win_game
        @controls.draw(200, 208, 2)
        @copyright.draw("YOU ARE WIN!", 272, 250, 3)
        @copyright.draw("SCORE:", 300, 275, 3)
        @copyright.draw("#{@window.total_score}", 320 - ((Math.log10(@window.total_score + 2).to_i) * 8)/2, 300, 3)
        @copyright.draw("Press ESC to exit from game", 210, 350, 3)
      end
    end
  end

  def update
    if @show_controls == false && @window.win_game == false
      if 270 < @window.mouse_x &&
      @window.mouse_x < 366 &&
      240 < @window.mouse_y &&
      @window.mouse_y < 272 && (@window.button_down? Gosu::MsLeft)
        new_game
      elsif 270 < @window.mouse_x &&
      @window.mouse_x < 366 &&
      290 < @window.mouse_y &&
      @window.mouse_y < 316 && (@window.button_down? Gosu::MsLeft)
        show_controls
      elsif 270 < @window.mouse_x &&
      @window.mouse_x < 366 &&
      338 < @window.mouse_y &&
      @window.mouse_y < 362 && (@window.button_down? Gosu::MsLeft)
        exit
      end
    end
    @show_controls = false if @window.button_down? Gosu::KbSpace
  end

  #new game button click event
  def new_game
    @display = false
    @window.pause = false
  end

  #show controls
  def show_controls
    @show_controls = true
  end

  #exit button click event
  def exit
    @window.pause = true
    @window.close
  end

end
