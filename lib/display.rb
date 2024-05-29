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

    intro
  end
end
