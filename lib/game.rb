class Game
  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def play_game
    until computer.tries_left == 0
      computer.display_current_info
      player.make_guess
      computer.evaluate_guess(player.guess)

      break if computer.player_won?
    end

    computer.display_results
  end

  private

  attr_reader :computer, :player
end
