require_relative 'game'
require_relative 'saving'
require_relative 'words'

class Manager
  def initialize
    @game = nil
  end

  def start
    loop do
      puts "\n--- Hangman ---"
      puts '(N)ew Game'
      puts '(L)oad Game'
      puts '(Q)uit'
      puts '> '

      case gets.chomp.downcase
      when 'n' then new_game
      when 'l' then load_game
      when 'q' then break
      else
        puts 'Invalid choice.'
      end
    end
  end

  def new_game
    word = Words.random_word
    @game = Game.new(word)
    play_loop
  end

  def load_game
    loaded_game = Saving.load
    if loaded_game
      @game = loaded_game
      puts "\nLoaded saved game!"
      play_loop
    else
      puts 'No saved game found. Starting new game.'
      new_game
    end
  end

  private

  def play_loop
    loop do
      @game.play_turn
      if @game.won?
        puts "\nYou did it! The word was #{@game.secret_word}."
        break
      elsif @game.lost?
        Hangman.display(@game.mistakes)
        puts "\nYou lost! The word was #{@game.secret_word}."
        break
      end
    end
  end
end
