require_relative '../piece.rb'
require_relative './stepper.rb'

class King < Piece
    include Stepper

    def move_dirs
        return :king
    end
    
end