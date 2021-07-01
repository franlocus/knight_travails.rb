# frozen_string_literal: true

# knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
# knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
# knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]

require_relative 'knight'
require_relative 'board'
   
board = Board.new

puts board.knight_moves([0,0],[3,3])

puts board.knight_moves([0,0],[1,2])

puts board.knight_moves([0,0],[7,7])
