class Hangman
  STAGES = [
    '







    ',
    '

  |
  |
  |
  |
  |
 /|\
    ',
    '
  ---------
  |
  |
  |
  |
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |
  |
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |       |
  |
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |      /|
  |
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |      /|\
  |
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |      /|\
  |      /
  |
 /|\
    ',
    '
  ---------
  |       |
  |       O
  |      /|\
  |      / \
  |
 /|\
    '
  ].freeze

  def self.display(mistakes)
    puts STAGES[[mistakes, STAGES.size - 1].min]
  end
end
