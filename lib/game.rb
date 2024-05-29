class Game
  include Serializable
  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def play_game
    until computer.tries_left == 0
      computer.display_current_info
      player.make_guess

      if player.guess == 'save'
        save_game
        return
      elsif player.guess == 'quit'
        return
      end
      computer.evaluate_guess(player.guess)

      break if computer.player_won?
    end

    computer.display_results
  end

  private

  attr_reader :computer, :player

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    filename = "saved_games/savefile#{Dir.new('saved_games').children.length}.yaml"
    save_file = File.new(filename, 'w')

    save_file.puts serialize
  end

  def serialize
    obj = {}
    obj[:player] = player.serialize
    obj[:computer] = computer.serialize

    @@serializer.dump(obj)
  end
end
