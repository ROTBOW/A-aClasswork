require_relative './piece.rb'
require_relative './null_piece.rb'

class Pawn < Piece
    def moves
        answer = []
        x, y = @pos
        answer.concat(forward_dir, at_start_row?, side_attacks)
        answer
    end

    private
    def at_start_row?
        if @color == :black && @pos[0] == 1
            return [[(@pos[0]+2), @pos[1]]]
        elsif @color == :white && @pos[0] == 6
            return [[(@pos[0]-2), @pos[1]]]
        else
            return []
        end
    end

    def forward_dir
        if @color == :white
            temp = [(@pos[0]-1), @pos[1]]
            return [temp] if @board[temp] == NullPiece.instance
        else
            temp = [(@pos[0]+1), @pos[1]]
            return [temp] if @board[temp] == NullPiece.instance
        end
        []
    end

    def side_attacks
        if @color == :white
            posi_attacks = [[-1,-1], [-1, 1]]
        elsif @color == :black
            posi_attacks = [[1,-1], [1, 1]]
        end
        posi_attacks.map! {|attack| [(@pos[0] + attack[0]),(@pos[1] + attack[1])] }
        posi_attacks.select{|attack| @board[attack] != NullPiece.instance }
    end

end