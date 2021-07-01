class Knight
    attr_accessor :square, :parent, :moves, :children
    
    def initialize(square, parent = nil, moves = nil, children = false)
        @square = square
        @parent = parent
        @moves = possible_moves(square)
        @children = children
    end

    def possible_moves(square)
        moves_vector = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
        moves_vector
        .map { |x, y| [square[0] + x, square[1] + y] }
        .keep_if { |move| move[0].between?(0, 7) && move[1].between?(0, 7)  }
    end

    def make_children
        @children = true
        @moves.map! { |move| Knight.new(move, self, possible_moves(move)) }
    end
end

def level_order(root, end_square,  level_order = [], marked_squares = [], queue = [root])

    until queue.empty? || level_order.find { |e| e.square == end_square}
        queue.first.make_children unless queue.first.children
        queue.first.moves.each do  |e| 
            marked_squares.include?(e.square) ? next : queue.push(e) & marked_squares.push(e.square) 
        end
        level_order.push(queue.shift)
    end
    shortest_path(level_order, end_square)
end

def shortest_path(level_order, end_square)
    path = []
    current = level_order.find { |e| e.square == end_square}
    until current.nil?
        path << current.square
        current = current.parent
    end
    path.reverse
end

knight = Knight.new [0,0]

level_order(knight, [3, 3])