require_relative './piece.rb'

class Pawn < Piece
    def moves
        answer = []
        x, y = @pos
        answer << [x+1, y]
        answer
    end

    def move_to?(pos)
        if moves.include?(pos)
            return true
        end
        false
    end

    private
    def at_start_row?
    end

    def forward_dir
    end

    def side_attacks
    end

end