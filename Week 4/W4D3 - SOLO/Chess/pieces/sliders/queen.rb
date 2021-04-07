require_relative '../piece.rb'
require_relative './slideable.rb'

class Queen < Piece
    include Slideable

    def move_dirs
        return :both
    end
    
end