require_relative './piece.rb'

class Pawn < Piece
    def moves
        answer = []
        x, y = @pos
        answer << [x+1, y]
        answer
    end

    private
    def at_start_row?(color)
    end

    def forward_dir
    end

    def side_attacks
    end

end