class Board
  attr_accessor :grid

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts "#{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts "---------"
    puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts "---------"
    puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
  end

  def make_move(position, player)
    if grid[position - 1].is_a?(Integer)
      grid[position - 1] = player
      true
    else
      puts "Position already taken. Try again!"
      false
    end
  end

  def winner?
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
      [0, 4, 8], [2, 4, 6]              # Diagonals
    ]

    win_combinations.each do |comb|
      if grid[comb[0]] == grid[comb[1]] && grid[comb[1]] == grid[comb[2]]
        return grid[comb[0]] # Return "X" or "O"
      end
    end
    nil
  end

  def draw?
    grid.all? { |pos| pos.is_a?(String) }
  end
end

class Game
  attr_accessor :board, :current_player

  def initialize
    @board = Board.new
    @current_player = "X"
  end

  def switch_player
    @current_player = current_player == "X" ? "O" : "X"
  end

  def play
    winner = nil

    until winner || board.draw?
      board.display
      player_move
      winner = board.winner?
      switch_player if winner.nil?
    end

    board.display
    if winner
      puts "Congratulations! Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end

  def player_move
    valid_move = false
    until valid_move
      puts "Player #{current_player}, choose a position (1-9):"
      position = gets.chomp.to_i
      valid_move = board.make_move(position, current_player)
    end
  end
end

game = Game.new
game.play
