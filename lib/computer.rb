class Computer
  WORD_DICT = File.open('words.txt')

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

  private

  attr_reader :secret_word_array, :progress_array, :incorrect_guesses, :tries_left

  def pick_secret_word
    all_words = WORD_DICT.readlines
    all_words[rand(all_words.length)].split('')
  end
end
