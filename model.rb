class Deck
  attr_reader :deck, :file, :discard

  def initialize(file)
    @file = file
    @deck = []
    @discard = []
    parse_from_file
    shuffle_cards
  end

  def pick_card
    deck.pop
  end

  def empty?
    deck.empty?
  end

  def add_to_discard(card_obj)
    discard << card_obj
  end

  def to_bottom(card_obj)
    deck.unshift(card_obj)
  end

  private

  attr_writer :deck

  def parse_from_file
    File.open(file).each_slice(3) {|line| deck << Card.new_from_parse(line)}
  end

  def shuffle_cards
    deck.shuffle!
  end
end

class Card
  attr_reader :definition, :answer, :incorrect_guesses

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
    @incorrect_guesses = []
  end

  def self.new_from_parse(str_array)
    Card.new(str_array[0].chomp, str_array[1].chomp)
  end

  def guess_correct?(guess)
    answer.downcase == guess.downcase
  end

  def record_guess(guess)
    incorrect_guesses << guess
  end
end
