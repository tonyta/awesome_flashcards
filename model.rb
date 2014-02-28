

class Deck
  attr_reader :deck, :file
  def initialize(file)
    @file = file
    @deck = []
    parse
  end

  def parse
    File.open(file).each_slice(3) {|line| deck << Card.new(line)}
  end

  def pick_card
    deck.shuffle!.pop
  end

  def empty?
    deck.empty?
  end

end


class Card
  attr_reader :definition, :answer
  def initialize(card)                              #HEY TONY, GO FUCK YOURSELF
    @definition = card[0].chomp
    @answer = card[1].chomp
  end

  def check_card(user_input)
    answer == user_input.downcase
  end
end




