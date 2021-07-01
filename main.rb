# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'
   
board = Board.new

puts board.knight_moves([0,0],[3,3])

puts board.knight_moves([0,0],[1,2])

puts board.knight_moves([0,0],[7,7])

# You made it in 2 moves!  Here's your path:
# [0, 0]
# [1, 2]
# [3, 3]

# You made it in 1 moves!  Here's your path:
# [0, 0]
# [1, 2]

# You made it in 6 moves!  Here's your path:
# [0, 0]
# [1, 2]
# [2, 4]
# [3, 6]
# [5, 7]
# [6, 5]
# [7, 7]