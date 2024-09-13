# frozen_string_literal: true

# Importing the game class and GameLogic module
require_relative 'lib/game'

# Initializing a new game
game = Game.new
game_over = false

puts '======================'
puts 'Welcome to Mastermind!'
puts '======================'

# Here we continue until our player_turns reach 12, or the player guesses correctly
until game_over

  # First we get a guess from the player
  puts 'Enter your guess as a 4-digit number using numbers from 1-6, for example: 4321'
  input = gets.chomp

  # Lets validate the input.
  # Regex reminder for myself: ^ starts, $ ends. [1-6] = numbers between 1 and 6 inclusive, {4} specifies 4 of them.
  if input.match(/^[1-6]{4}$/)
    # guess gets the input code as a string, chars returns an array containing each character,
    # finally, map passes the block method :to_i to make it an array of integers
    guess = input.chars.map(&:to_i)
  else
    puts 'Invalid input: please enter a valid 4-digit number using only numbers from 1-6.'
    next
  end

  # Game#play_turn will handle the turn-based logic, so we continue until the player wins or loses.
  game_over = game.play_turn(guess)
end

# Close the game
puts 'Game over!'
