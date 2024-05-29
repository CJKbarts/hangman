class Computer
  WORD_DICT = File.open('words.txt')
  attr_reader :tries_left

  def initialize
    @secret_word_array = pick_secret_word
    @progress_array = Array.new(secret_word_array.length, '-')
    @incorrect_guesses = []
    @tries_left = 8
  end

  def display_current_info
    puts <<~info
      Progress: #{progress_array.join}
      Incorrect Guesses: #{incorrect_guesses.join(', ')}
      Tries left: #{tries_left}

    info
  end

  def evaluate_guess(guess)
    unless secret_word_array.include?(guess)
      incorrect_guesses.push(guess)
      @tries_left -= 1
    else
      update_progress(guess)
    end
  end

  def player_won?
    progress_array == secret_word_array
  end

  def display_results
    puts player_won? ? "You won!!" : "You lost"
    puts "The word was #{secret_word_array.join}"
  end

  private

  attr_reader :secret_word_array, :progress_array, :incorrect_guesses

  def pick_secret_word
    all_words = WORD_DICT.readlines
    all_words[rand(all_words.length)].split('')
  end

  def update_progress(guess)
    secret_word_array.each_with_index do |letter, index|
      progress_array[index] = guess if letter == guess
    end
  end
end
