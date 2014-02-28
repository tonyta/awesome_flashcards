require_relative 'model'
require_relative 'view'

class FlashcardsController
  attr_accessor :deck, :display

  def initialize(filename)
    @deck = Deck.new(filename)
    @display = GameView.new
  end

  def run
    display.welcome
    until deck.empty?
      card = deck.pick_card
      play(card)
      deck.add_to_discard(card)
    end
  end

  private

  def play(card)
    card_view = CardView.new(card)
    card_view.display_definition
    guess_loop(card, card_view)
  end

  def guess_loop(card, card_view)
    feedback = FeedbackView.new
    loop do
      input = display.get_input
      if input =~ /^--/
        options(input)
        return
      elsif card.guess_correct?(input)
        feedback.correct_reply
        return
      else
        card.record_guess(input)
        feedback.incorrect_reply
      end
    end
  end

  def options(option_str)
    puts "options!\n\n"
  end

end
