# frozen_string_literal: true

require './player'
require './human'
require './computer'

# Main class which plays the game
class Game
  GUESSES = 6
  VALID_INTS = [1, 2, 3, 4, 5, 6].freeze

  def initialize(setter_class, breaker_class)
    @code_maker = setter_class.new
    @code_breaker = breaker_class.new
    @player = Player.new
  end

  def play
    i = 1
    code = 0
    while i <= GUESSES
      if i == 1
        puts 'Welcome to Mastermind!'
        code = @player.setter(@code_maker, VALID_INTS)
      end
      @player.breaker(@code_breaker, VALID_INTS, code, i)
      i += 1
    end
    puts "The code was #{code.join('')}"
    puts 'Thanks for playing!'
  end
end

Game.new(Computer, Human).play
