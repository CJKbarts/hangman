class Game
  include Serializable
  def initialize(input)
    (input == '1') ? new_game : load_game
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
    File.delete(save_file) unless save_file.nil?
  end

  private

  attr_reader :computer, :player, :save_file

  def new_game
    @computer = Computer.new
    @player = Player.new
  end

  def load_game
    unless Dir.exist?('saved_games') && !Dir.empty?('saved_games')
      puts "You have no save files"
      puts
      new_game
    else
      @save_file = pick_save_file
      unserialize(File.read(save_file))
    end
  end

  def pick_save_file
    save_files = Dir.children('saved_games')
    puts 'Please pick a savefile by number: '
    save_files.each_with_index do |filename, index|
      puts "#{index + 1}. #{filename}"
    end

    input = gets.chomp.to_i - 1
    "saved_games/#{save_files[input]}"
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    filename = "saved_games/savefile#{Dir.new('saved_games').children.length}.yaml"
    save_file = File.new(filename, 'w')
    puts "Your game state was saved in the file, '#{filename}'"

    save_file.puts serialize
  end

  def serialize
    obj = {}
    obj[:player] = player.serialize
    obj[:computer] = computer.serialize

    @@serializer.dump(obj)
  end

  def unserialize(string)
    obj = @@serializer.load(string, permitted_classes: [Symbol, Player, Computer])

    @player = Player.new.unserialize(obj[:player])
    @computer = Computer.new.unserialize(obj[:computer])
  end
end
