# frozen_string_literal: true

require_relative 'game_logic'

# The Game class inherits #correct_positions and #correct_numbers from GameLogic
class Game
  attr_reader :code

  def initialize
    @code = Array.new(4) { rand(1..6) }
    @player_turns = 0
  end

  def play_turn(guess)
    # every time the player guesses we need to increment by 1
    @player_turns += 1

    # Keep a copy of the code generated upon initializing an instance of the Game class
    code_copy = @code.dup

    correct_position = GameLogic.correct_positions(guess, code_copy)
    correct_number = GameLogic.correct_numbers(guess, code_copy)

    if correct_position == 1
      puts 'You got 1 digit in the correct position'
    else
      puts "You got #{correct_position} digits in the correct position"
    end

    puts "You got #{correct_number} digit(s) correct but in the wrong position"
    puts "You have #{12 - @player_turns} turns left"

    if correct_position == 4
      puts "Congrats, you guessed the correct code: #{@code.join}."
      return true
    end

    if @player_turns >= 12
      puts "Sorry, you're out of turns! The code was #{code.join}."
      return true
    end

    # if we somehow get through all that without completing a game, we return false
    false
  end
end
