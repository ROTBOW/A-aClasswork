require_relative './pieces/all_pieces.rb'

class Board
    attr_reader :rows
    
    
    def place_pieces
        # black pieces
        # @rows.each_with_index{|ele, i| @rows[1][i] = Pawn.new(:black, self, [1, i], :♟) }
        @rows[0][0] = Rook.new(:black, self, [0,0], :♜) 
        @rows[0][7] = Rook.new(:black, self, [0,7], :♜)
        @rows[0][6] = Knight.new(:black, self, [0,6], :♞) 
        @rows[0][1] = Knight.new(:black, self, [0,1], :♞) 
        @rows[0][2] = Bishop.new(:black, self, [0,2], :♝)
        @rows[0][5] = Bishop.new(:black, self, [0,5], :♝)
        @rows[0][3] = Queen.new(:black, self, [0,3], :♛)
        @rows[0][4] = King.new(:black, self, [0,4], :♚)

        # white pieces
        # @rows.each_with_index{|ele, i| @rows[6][i] = Pawn.new(:white, self, [6, i], :♙) }
        @rows[7][0] = Rook.new(:white, self, [7,0], :♖) # should be at [7,0]
        @rows[7][7] = Rook.new(:white, self, [7,7], :♖) 
        @rows[7][1] = Knight.new(:white, self, [7,1], :♘)
        @rows[7][6] = Knight.new(:white, self, [7,6], :♘)
        @rows[7][2] = Bishop.new(:white, self, [7,2], :♗)
        @rows[7][5] = Bishop.new(:white, self, [7,5], :♗)
        @rows[7][4] = Queen.new(:white, self, [7,4], :♕)
        @rows[7][3] = King.new(:while, self, [7,3], :♔)
    end
    
    def initialize
        @rows = Array.new(8) {Array.new(8) {NullPiece.instance}}
        place_pieces
    end
    
    def [](pos)
        x, y = pos
        @rows[x][y]
    end
    
    def []=(pos, value)
        x, y = pos
        @rows[x][y] = value
    end
    
    def vaild_pos?(pos)
        x, y = pos
        (0..7).include?(x) && (0..7).include?(y)  
    end

    def vaild_end_point?(pos)
    end
    
    def move_piece(start_pos, end_pos) # might need a color agument later
        raise "empty cell" unless self.vaild_pos?(start_pos) && self[start_pos] != NullPiece.instance
        raise "can't move there" unless self.vaild_pos?(end_pos)
        if self[start_pos].move_to?(end_pos)
            in_hand = self[start_pos]
            self[start_pos] = NullPiece.instance
            in_hand.pos = end_pos
            self[end_pos] = in_hand
            return true
        end
        false
    end
    
    
end
