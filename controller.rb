require_relative 'model'
require_relative 'view'

class FlashcardsController
  attr_accessor :deck

  def initialize(filename)
    @deck = Deck.new(filename)
  end

  def run
    WelcomeView.new.welcome
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
      if card.guess_correct?( card_view.prompt_guess )
        feedback.correct_reply
        return
      else
        feedback.incorrect_reply
      end
    end
  end
end
