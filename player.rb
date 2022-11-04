require './analyzer'

class Player
  include Analyzer

  def initialize; end

  def setter(player, valid_ints)
    puts "Valid numbers: #{valid_ints}"
    player.set(valid_ints, 4)
  end

  def breaker(player, valid_ints, code, guess_no)
    puts "Enter guess ##{guess_no}: "
    player.break(valid_ints, code, 4)
  end

  private

  def get_valid_code(code, length, valid_ints)
    code_array = code.split('').map { |element| element.to_i }
    until code.length == length && code_array.all? { |element| valid_ints.include?(element) }
      puts 'Enter valid code: '
      code = gets.chomp
      code_array = code.split('').map { |element| element.to_i }
    end
    code_array
  end
end