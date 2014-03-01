require_relative 'model'
require_relative 'view'

class FlashcardsController
  attr_accessor :deck, :display

  def initialize(filename)
    @deck = Deck.new(filename)
    @display = GameView.new
  end

  def run
    until deck.empty?
      display.clear
      display.welcome
      card = deck.pick_card
      play(card)
    end
  end

  private

  def play(card)
    CardView.new(card).display_definition
    input_loop(card)
  end

  def input_loop(card)
    loop do
      input = display.get_input
      if input.sub!(/^--/, '')
        return if options(input, card)
      elsif card.guess_correct?(input)
        display.correct_reply
        deck.add_to_discard(card)
        return
      else
        card.record_guess(input)
        display.incorrect_reply
      end
    end
  end

  def options(option, card)
    case option
    when 'help'
      display.help
      false
    when 'skip'
      deck.to_bottom(card)
      true
    when 'greg'
      puts 'quitter'
      exit!
    when 'report'
      puts 'a report is here'
      false
    else
      puts 'else'
      false
    end
  end
end
