
class Piece
    attr_reader :color, :board, :face, :pos

    def initialize(color, board, pos, face)
        @color = color
        @face = face
        @board = board
        @pos = pos
    end

    def move_to?(pos)
        if moves.include?(pos) && @board[pos].color != @color
            return true
        end
        false
    end

    def to_s
        return @face
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
        @pos = val
    end

    def move_into_check?(end_pos)
    end

end