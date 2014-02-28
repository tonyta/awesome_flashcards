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
      #so stuff
    end
  end
end
