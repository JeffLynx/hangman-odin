class Words
  DICTIONARY_PATH = File.expand_path('../data/google-10000-english-no-swears.txt', __dir__)
  WORDS = File.readlines(DICTIONARY_PATH, chomp: true)
  VALID_WORDS = WORDS.select { |word| word.length.between?(5, 12) }

  def self.random_word
    VALID_WORDS.sample
  end
end
