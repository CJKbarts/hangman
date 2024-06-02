require 'yaml'
require_relative 'lib/display'
require_relative 'lib/serializable'
require_relative 'lib/computer'
require_relative 'lib/player'
require_relative 'lib/game'

include Display

display_intro
display_prompt

input = '3'
until %[12].include?(input)
  print ' > '
  input = gets.chomp
end
game = Game.new(input)
game.play_game
