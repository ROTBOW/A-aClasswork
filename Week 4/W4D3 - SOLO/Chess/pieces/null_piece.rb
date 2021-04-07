require 'singleton'
require_relative "piece.rb"

class NullPiece < Piece
    include Singleton

    def initialize
        # super(color=nil, board=nil, pos=nil, face=nil)
        @face = :□
    end
end