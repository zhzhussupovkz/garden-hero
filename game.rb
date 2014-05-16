#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "core/level/level"
require_relative "core/level/level_generator"
require_relative "core/level/star"
require_relative "core/level/apple"
require_relative "core/level/enemy"
require_relative "core/player/apple_player"
require_relative "core/player/player"
require_relative "core/game_window"

GameWindow.instance.show
