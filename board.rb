class Board

    def create_graph(end_square, marked_squares = [], queue = [@root])
        until marked_squares.include?(end_square)
            queue.first.moves
                    .keep_if { |e| !marked_squares.include?(e) }
                    .each { |e| marked_squares.push(e) }
            queue.first.make_moves_nodes!
            queue.first.moves.each { |e| queue.push(e) }
            queue.shift
        end
    end
    
    def level_order
        level_order = []
        queue = [@root ]
        until queue.empty?
            queue.first.moves.each { |move| queue.push(move) unless move.is_a?(Array) }
            level_order.push(queue.shift)
        end
        level_order
    end
    
    def shortest_path(end_square, path = [])
        current = level_order.find { |e| e.square == end_square}
        until current.nil?
            path << current.square
            current = current.parent
        end
        path.reverse
    end

    def knight_moves(start_square, end_square)
       @root = Knight.new(start_square)
       create_graph(end_square)
       path = shortest_path(end_square)
       puts "You made it in #{path.size - 1} moves!  Here's your path:"
       path.each { |move| print "#{move}\n" }
       return
    end
end
