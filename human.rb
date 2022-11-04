# All inputs from user
class Human < Player
  def set(valid_ints, length)
    puts 'Enter your secret code: '
    code = gets.chomp
    get_valid_code(code, length, valid_ints)
  end

  def break(valid_ints, code, length)
    guess = gets.chomp
    valid_guess = get_valid_code(guess, length, valid_ints)
    exact_matches = exact_match(valid_guess, code).count(true)
    matches = match(valid_guess, code)
    puts "There are #{exact_matches} exact matches and #{matches} matches."
  end
end