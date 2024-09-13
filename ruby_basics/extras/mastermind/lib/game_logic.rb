# frozen_string_literal: true

# GameLogic provides the methods to show if the player input the digits
# in the correct positions or how many correct digits they input
module GameLogic
  def self.correct_positions(guess, code_copy)
    correct_position = 0
    guess.each_with_index do |num, index|
      next unless num == code_copy[index]

      correct_position += 1
      code_copy[index] = nil
      guess[index] = nil
    end
    correct_position
  end

  def self.correct_numbers(guess, code_copy)
    correct_number = 0

    guess.each_with_index do |num, _|
      next if num.nil?

      if code_copy.include?(num)
        correct_number += 1
        code_copy[code_copy.index(num)] = nil
      end
    end

    # return the ultimate value of the correct_number
    correct_number
  end
end
