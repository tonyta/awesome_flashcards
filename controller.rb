require_relative 'model'
require_relative 'view'

class FlashcardsController
  attr_accessor :deck

  def initialize(filename)
    @deck = Deck.new(filename)
  end

  def run
    Welcome.new.welcome
    until deck.empty?
      card = deck.pick_card
      play(card)
    end
  end

  def play(card)
    feedback = FeedbackView.new
    view = CardView.new(card)
    view.display_definition
    loop do
      guess = view.prompt_guess
      if card.check_card(guess)
        feedback.correct_reply
        break
      else
        feedback.incorrect_reply
      end
    end
  end
end
