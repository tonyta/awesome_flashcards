class WelcomeView
  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
  end
end

class CardView
  def display_definition(card_obj)
    puts "Definition:\n#{card_obj.definition}"
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
