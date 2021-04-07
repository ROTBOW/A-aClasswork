require_relative '../null_piece.rb'

module Slideable

    HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    DIAGONAL_DIRS = [[1,1], [-1,-1], [-1, 1], [1, -1]]

    def moves
        direction = case move_dirs
        when :horizontal
            return grow_unblocked_moves_in_dir(HORIZONTAL_DIRS)
        when :diagonal
            return grow_unblocked_moves_in_dir(DIAGONAL_DIRS)
        when :both
            return grow_unblocked_moves_in_dir(HORIZONTAL_DIRS + DIAGONAL_DIRS)
        end
    end

    def move_dirs
        #sudo code, this will return a sybol to show how it can move
    end
    
    def grow_unblocked_moves_in_dir(direction)
        answer = []
        direction.each do |dir|
            current_pos = @pos
            until !(0..7).include?(current_pos[0]) || !(0..7).include?(current_pos[1])
                x, y = current_pos
                current_pos = [(dir[0] + x), (dir[1] + y)]
                answer << current_pos
                break unless @board[current_pos] == NullPiece.instance
            end
        end
        answer
    end

end