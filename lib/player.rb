class Player
  include Serializable
  attr_reader :guess

  def initialize
    @history = []
  end

  def make_guess
    print "Please make a guess: "
    input = gets.chomp.downcase until valid_guess?(input)
    puts
    history.push(input)
    @guess = input
  end

  private

  attr_reader :history

  def valid_guess?(input)
    return false if input.nil?
    return true if input == 'save' || input == 'quit'

    correct_length?(input) && letter?(input) && not_guessed_already?(input)
  end

  def correct_length?(input)
    if input.length == 1
      true
    else
      print 'Please guess a single letter: '
      false
    end
  end

  def letter?(input)
    if input.match?(/[[:alpha:]]/)
      true
    else
      print 'Please enter a letter: '
      false
    end
  end

  def not_guessed_already?(input)
    if history.include?(input)
      print "Please enter a letter you haven't guessed: "
      false
    else
      true
    end
  end
end
