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
    CardView.new(card).display_definition
    guess_loop(card)
  end

  def guess_loop(card)
    loop do
      input = display.get_input
      if input.sub!(/^--/, '')
        return if options(input, card)
        # return
      elsif card.guess_correct?(input)
        display.correct_reply
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
      puts 'skip option'
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
