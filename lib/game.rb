require_relative 'hangman'
require_relative 'saving'

class Game
  attr_accessor :secret_word, :discovered_ch, :guesses, :turns, :mistakes

  MAX_MISTAKES = Hangman::STAGES.size - 1

  def initialize(secret_word)
    @secret_word = secret_word
    @discovered_ch = Array.new(secret_word.length, '_')
    @guesses = []
    @turns = 0
    @mistakes = 0
  end

  def play_turn
    puts "\n#{'-' * 20}"
    Hangman.display(@mistakes)
    puts "\nWord: #{@discovered_ch.join(' ')}"
    puts "Guessed so far: #{@guesses.join(', ')}" unless @guesses.empty?

    puts 'Save game? (y/n)'
    choice = gets.chomp.downcase
    if choice == 'y'
      Saving.save(self)
      puts 'Returning to menu...'
      sleep(1)
      exit
    end

    puts 'Guess a letter: '

    guess = gets.chomp.downcase

    if guess.empty? || guess.length > 1 || @guesses.include?(guess)
      puts 'Invalid or repeated guess. Try again!'
      return
    end

    @guesses << guess
    @turns += 1

    if @secret_word.include?(guess)
      @secret_word.each_char.with_index do |char, i|
        @discovered_ch[i] = char if char == guess
      end
      puts 'Good job!'
    else
      @mistakes += 1
      puts 'Try again!'
    end
  end

  def won?
    @discovered_ch.join == @secret_word
  end

  def lost?
    @mistakes >= MAX_MISTAKES
  end
end
