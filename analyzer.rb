# frozen_string_literal: true

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
    rem_exact = array.filter do
      i += 1
      !exact[i]
    end
    i = -1
    new_comp_array = comp_array.filter do
      i += 1
      !exact[i]
    end
    matches = rem_exact.filter { |element| new_comp_array.include?(element) }
    matches.uniq.length
  end
end
