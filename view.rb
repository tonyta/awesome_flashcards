class WelcomeView
  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!\n\n"
  end
end

class CardView
  def initialize(card_obj)
    @card = card_obj
  end

  def display_definition
    puts "Definition:\n#{card.definition}\n\n"
  end

  def prompt_guess
    print "Guess: "
    gets.chomp
  end

  private

  attr_reader :card
end

class FeedbackView
  def correct_reply
    puts "Correct!\n\n"
  end

  def incorrect_reply
    puts "Incorrect! Try again.\n\n"
  end
end
