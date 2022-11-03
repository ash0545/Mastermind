class Game

  GUESSES = 0

  def initialize(setter_class, breaker_class)

  end

  def play()
    i = 0
    while i < GUESSES do

    end
  end
end

class Player
  def initialize()

  end

  def setter_input(code)

  end

  def breaker_input(guess)

  end
end

class Human < Player # All inputs from user

end

class Computer < Player # All automatic inputs

end

Game.new(Computer, Human).play