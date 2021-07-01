require_relative 'knight'
require_relative 'board'

   # knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
   # knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
   # knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]

   def knight_moves(start_square, end_square)
       
   end

board = Board.new


def level_order
    level_order = []
    queue = Array.new(1) { @root }
    until queue.empty?
        current = queue.first
        queue.push(current.edges) unless current.edges.nil?
        
        level_order.push(queue.shift)
    end
    level_order.map(&:data)
end