require_relative './pieces/all_pieces.rb'

class Board
    attr_reader :rows
    
    
    def place_pieces
        # @rows[0][0] = :rook
        # @rows[0][7] = :rook
        # @rows[7][0] = :rook
        # @rows[7][7] = :rook
        
        @rows[0][1] = Knight.new(:black, self, [0,1], :♞) 
        @rows[0][6] = Knight.new(:black, self, [0,6], :♞) 
        @rows[7][1] = Knight.new(:white, self, [7,1], :♘)
        @rows[7][6] = Knight.new(:white, self, [7,6], :♘)
        
        # @rows[0][2] = :bishop
        # @rows[0][5] = :bishop
        # @rows[7][2] = :bishop
        # @rows[7][5] = :bishop
        
        @rows[0][3] = Queen.new(:black, self, [0,3], :♛)
        @rows[7][4] = Queen.new(:white, self, [7,4], :♕)
        
        @rows[0][4] = King.new(:black, self, [0,4], :♚)
        @rows[7][3] = King.new(:while, self, [7,3], :♔)
        
        
        @rows.each_with_index{|ele, i| @rows[1][i] = Pawn.new(:black, self, [1, i], :♟) }
        @rows.each_with_index{|ele, i| @rows[6][i] = Pawn.new(:white, self, [6, i], :♙) }
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
    
    def move_piece(start_pos, end_pos) #might need a color agument later
        raise "empty cell" unless self.vaild_pos?(start_pos) && self[start_pos] != NullPiece.instance
        raise "can't move there" unless self.vaild_pos?(end_pos) && self[end_pos] == NullPiece.instance # have to add condition for checking end position
        if self[start_pos].move_to?(end_pos)
            in_hand = self[start_pos]
            self[start_pos] = NullPiece.instance
            self[end_pos] = in_hand
            return true
        end
        false
    end
    
    
end

# b = Board.new

# p b.rows
