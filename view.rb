class GameView
  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!\n\n"
  end

  def help
    color = "\033[33m"
    puts <<-help_string

Make a guess or use the following options:
  #{color}--help\033[0m    gets help (this screen)
  #{color}--skip\033[0m    skips the current card (putting it at the bottom of the deck)
  #{color}--report\033[0m  gives you a report of how you are doing so far
  #{color}--greg\033[0m    quit out of the program because you're a big quitter

    help_string
  end

  def get_input
    print "Guess: "
    gets.chomp
  end

  def correct_reply
    puts "Correct!\n\n"
  end

  def incorrect_reply
    puts "Incorrect! Try again.\n\n"
  end
end

class CardView
  def initialize(card_obj)
    @card = card_obj
  end

  def display_definition
    puts "Definition:\n#{card.definition}\n\n"
  end

  private

  attr_reader :card
end
