class Knight
    attr_accessor :square, :parent, :moves

    def initialize(square, parent = nil, moves = nil)
        @square = square
        @parent = parent
        @moves = possible_moves(square)
    end

    def possible_moves(square)
        moves_vector = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
        moves_vector
        .map { |x, y| [square[0] + x, square[1] + y] }
        .keep_if { |move| move[0].between?(0, 7) && move[1].between?(0, 7) }
    end

    def make_moves_nodes!
        @moves.map! { |move| Knight.new(move, self, possible_moves(move)) }
    end
end