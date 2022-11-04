# For analyzing how many matches and exact matches are present between two arrays
module Analyzer
  # returns array with true for exact matches
  def exact_match(array, comp_array)
    i = -1
    array.map do |element|
      i += 1
      element == comp_array[i]
    end
  end

  def match(array, comp_array)
    exact = exact_match(array, comp_array)
    i = -1
    rem_exact = array.reject do
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