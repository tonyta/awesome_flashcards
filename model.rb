

class Deck
  attr_reader :deck, :file  # => nil
  def initialize(file)
    @file = file            # => "flashcard_samples.txt"
    @deck = []              # => []
    parse                   # => nil
  end

  def parse
    File.open(file).each_slice(3) {|line| deck << Card.new(line)}  # => nil
  end

end


class Card
  def initialize(card)
    @definition = card[0].chomp  # => "To create a second name for the variable or method.", "A command that appends two or more objects together.", "Designates code that must be run unconditionally at the beginning of the program before any other.", "Delimits a \"begin\" block of code, which can allow the use of while and until in modifier position with multi-line statements.", "Gives an unconditional termination to a code block, and is usually placed with an argument.", "starts a case state...
    @answer = card[1].chomp      # => "alias", "and", "BEGIN", "begin", "break", "case", "class", "def", "defined?", "do", "else", "elsif", "END", "end", "ensure", "false", "for", "if", "in", "module", "next", "nil", "not", "or", "redo", "rescue", "retry", "return", "self", "super", "then", "true", "undef", "unless", "until", "when", "while", "yield"
  end
end


test = Deck.new('flashcard_samples.txt')  # => #<Deck:0x007fd673867a08 @file="flashcard_samples.txt", @deck=[#<Card:0x007fd673866658 @definition="To create a second name for the variable or method.", @answer="alias">, #<Card:0x007fd673865258 @definition="A command that appends two or more objects together.", @answer="and">, #<Card:0x007fd673864538 @definition="Designates code that must be run unconditionally at the beginning of the program before any other.", @answer="BEGIN">, #<Card:0x007fd6...
