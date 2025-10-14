class Game
  DICTIONARY_PATH = './google-10000-english-no-swears.txt'.freeze
  WORDS = File.readlines(DICTIONARY_PATH, chomp: true)
  VALID_WORDS = WORDS.select { |word| word.length.between?(5, 12) }

  def initialize
    @secret_word = VALID_WORDS.sample
    @discovered_ch = '_' * @secret_word.length
    @guessed_ch = []
    # puts "Loaded #{WORDS.size} words."
    # puts "Example word: #{WORDS.sample}"
    # puts "Secret word chosen: #{@secret_word}"
  end

  def play
    puts "The word has #{@secret_word.length} letters."

    loop do
      puts "Discovered letters: #{@discovered_ch}."
      puts 'Guess a letter: '
      guess = gets.chomp.downcase

      next if guess.empty? || guess.length > 1 || @guessed_ch.include?(guess)

      @guessed_ch << guess

      if @secret_word.include?(guess)
        @secret_word.each_char.with_index do |char, i|
          @discovered_ch[i] = char if char == guess
        end
        puts 'Good job!'
      else
        puts 'Try again!'
      end

      puts "Guessed so far: #{@guessed_ch.join(', ')}"

      next unless @discovered_ch == @secret_word

      puts "You did it! The secret word was #{@secret_word}."
      puts 'Play again? (y/n)'
      answer = gets.chomp.downcase
      break if answer == 'n'

      Game.new.play if answer == 'y'
    end
  end
end

game = Game.new
game.play
