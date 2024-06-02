module Display
  def display_intro
    puts <<~intro
      Welcome To Hangman!!

      In this game, the computer chooses a word and you are to guess that word
      by guessing all it's letters

      During the game, the computer would display you're progress before each turn
      For each letter you guess right, the computer would display where in the
      secret word that letter fits
      For each letter guessed wrong, the computer would add it to a list showing all
      incorrect guesses.

      You only use up your tries when you guess a letter wrongly. You get 7 tries for
      each game

      To save the game at any point, please enter 'save' when prompted to guess
      To quit the game at any point, please enter 'quit' when prompted to guess

    intro
  end

  def display_prompt
    puts <<~prompt
      Please enter 1 or 2
      [1] New game
      [2] Load game
    prompt
  end
end
