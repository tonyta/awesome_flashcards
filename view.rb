class WelcomeView
  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
  end
end

class CardView
  attr_accessor :card

  def initialize(card_obj)
    @card = card_obj
  end

  def display_definition
    puts "Definition:\n#{card.definition}"
  end

  def prompt_guess
    print "Guess: "
    gets.chomp
  end
end

# class OptionsView
# end

class FeedbackView
  def correct_reply
    puts "Correct!"
  end

  def incorrect_reply
    puts "Incorrect! Try again."
  end
end
