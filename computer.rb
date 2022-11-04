# All automatic inputs
class Computer < Player 
  def set(valid_ints, length)
    puts 'Computer has set the code!'
    random_code_gen(valid_ints, length)
  end

  def break(); end

  private

  def random_code_gen(valid_ints, length)
    valid_ints.shuffle.slice(0, length)
  end

  def guess_logic(); end
end