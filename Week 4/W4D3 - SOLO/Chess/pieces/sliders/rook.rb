require_relative '../piece.rb'
require_relative './slideable.rb'

class Rook < Piece
    include Slideable

    def move_dirs
        return :horizontal
    end
    
end