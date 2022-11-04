class Game

  GUESSES = 6
  VALID_INTS = [1, 2, 3, 4, 5, 6]

  include Analyzer

  def initialize(setter_class, breaker_class)
    @code_maker = setter_class.new()
    @code_breaker = breaker_class.new()
    @player = Player.new()
  end

  def play
    i = 1
    while i <= GUESSES do
      if i == 1
        puts "Welcome to Mastermind!"
        code = player.setter(@code_maker, VALID_INTS)
        player.breaker(@code_breaker, GUESSES, i)
      else
        player.breaker(@code_breaker, GUESSES, i)
      end
      i += 1
    end
    puts "Thanks for playing!"
  end
end

class Player
  def initialize()

  end

  def setter(player, valid_ints)
    puts "Valid numbers: #{valid_ints}"
    player.set(valid_ints, 4)
  end

  def breaker(player, total_guesses, guess_no)
    puts "Enter guess ##{guess_no}: "
    player.break
  end

  private
  def get_valid_code(code, length, valid_ints)
    code_array = code.split('').map {|element| element.to_i}
    until code.length == length && code_array.all? {|element| valid_ints.include?(element)} do
      puts "Enter valid code: "
      code = gets.chomp
      code_array = code.split('').map {|element| element.to_i}
    end
    code_array
  end
end

class Human < Player # All inputs from user
  def set(valid_ints, length)
    puts "Enter your secret code: "
    code = gets.chomp
    get_valid_code(code, length, valid_ints)
  end

  def break(valid_ints, length)
    guess = gets.chomp
    get_valid_code(guess, length, valid_ints)
  end
end

class Computer < Player # All automatic inputs
  def set(valid_ints, length)
    puts "Computer has set the code!"
    random_code_gen(valid_ints, length)
  end

  def break()

  end

  private
  def random_code_gen(valid_ints, length)
    return valid_ints.shuffle.slice(0,length)
  end

  def guess_logic()

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