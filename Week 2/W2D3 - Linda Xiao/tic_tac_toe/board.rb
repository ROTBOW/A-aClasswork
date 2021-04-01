class Board

    def initialize(size=3)
        @size = size
        @grid = Array.new(size) {Array.new(size) {'_'} }
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, mark)
        x, y = pos
        @grid[x][y] = mark
    end

    def valid?(pos)
        x, y = pos
        if x < @grid.size || y < @grid.size || x < -1 || y < -1
            return false
        end
        true 
    end

    def empty?(pos)
        if self[pos] != '_'
            return false
        end
        true
    end

    def place_mark(pos, mark)
        if !self.empty?(pos) && !self.valid?(pos)
            raise 'can\'t place there'
        end
        
        self[pos] = mark
        true
    end


    def print
        @grid.each {|row| p row }
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.count(mark) == @size
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            return true if row.count(mark) == @size
        end
        false
    end

    def win_diagonal?(mark)
        right = []
        left = []

        @grid.each_with_index do |row, idx|
            right << @grid[idx][idx]
            left << @grid[idx][@grid.length - 1 - idx]
        end

        if right.uniq.length == 1 && right.uniq[0] == mark
            return true
        end

        if left.uniq.length == 1 && left.uniq[0] == mark
            return true
        end

        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        if @grid.flatten.include? '_'
            return true
        end
        false
    end

end