require_relative '../piece.rb'
require_relative './stepper.rb'

class Knight < Piece
    include Stepper

    def move_dirs
        return :knight
    end
    
end