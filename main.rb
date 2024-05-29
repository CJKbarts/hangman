require_relative 'lib/display'
require_relative 'lib/computer'
require_relative 'lib/game'

include Display

display_intro
game = Game.new
game.play_game
