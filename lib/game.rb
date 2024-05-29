class Game
  def initialize
    @computer = Computer.new
  end

  def play_game
    computer.display_current_info
  end

  private

  attr_reader :computer
end
