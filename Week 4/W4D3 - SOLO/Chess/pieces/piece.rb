
class Piece
    attr_reader :color, :board, :pos, :face

    def initialize(color, board, pos, face)
        @color = color
        @face = face
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def move_into_check?(end_pos)
    end

end