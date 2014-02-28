class Deck
  attr_reader :deck, :file

  def initialize(file)
    @file = file
    @deck = []
    parse_from_file
    shuffle_cards
  end

  def pick_card
    deck.pop
  end

  def empty?
    deck.empty?
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
  attr_reader :definition, :answer

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
  end

  def self.new_from_parse(str_array)
    Card.new(str_array[0].chomp, str_array[1].chomp)
  end

  def check_card(guess)
    answer.downcase == guess.downcase
  end
end
