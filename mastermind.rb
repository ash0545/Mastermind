class Game

  GUESSES = 6
  CODE = 1234

  def initialize(setter_class, breaker_class)
    @setter = setter_class.new()
    @breaker = breaker_class.new()
  end

  def play
    i = 1
    while i <= GUESSES do
      puts "Welcome to Mastermind!" if i == 1
      
      i += 1
    end
  end
end

class Player
  def initialize(game)
    @game = game
  end

  def setter(player)
    player.set
  end

  def breaker(player, total_guesses)
    for i in 1..total_guesses do
      puts "Enter guess ##{i}: "
      player.break
  end
end

class Human < Player # All inputs from user
  def set()

  end

  def break()

  end
end

class Computer < Player # All automatic inputs
  def set()

  end

  def break()

  end
end

module Analyzer
  def exact_match(array, comp_array) # returns array with true for exact matches
    i = -1
    array.map do |element|
      i += 1
      element == comp_array[i]
    end
  end

  def match(array, comp_array)
    exact = exact_match(array, comp_array)
    i = -1
    rem_exact = array.reject do |element|
      i += 1
      exact[i]
    end
    matches = 0
    rem_exact.each do |element|
      matches += 1 if comp_array.include?(element)
    end
    matches
  end
end

Game.new(Computer, Human).play