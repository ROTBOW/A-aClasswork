class Board

    def initialize(size=3)
        @grid = Array.new(size) {Array.new(size) { '_' } }
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def valid?(pos)
        x, y = pos
        if x < -1 && x > @grid.size
            return false
        end

        if y < -1 && y > @grid.size
            return false
        end

        true
    end

    def empty?(pos)
        return false if self[pos] != '_'
        true
    end

    def place_mark(pos, mark)

        if !valid?(pos) || !empty?(pos)
            raise 'something went wrong'
        end
        self[pos] = mark
    end

    def print
        @grid.each {|row| p row }
    end

    def win_row?(mark)
        @grid.each {|row| return true if row.count(mark) == row.length }
        false
    end

    def win_col?(mark)
        @grid.transpose.each {|row| return true if row.count(mark) == row.length }
        false
    end

    def win_diagonal?(mark)
        right = []
        left = []

        (0...@grid.length).each do |i|
            right << @grid[i][i]
            left << @grid[i][@grid.length - 1 - i]
        end

        if right.count(mark) == right.length
            return true
        end

        if left.count(mark) == left.length
            return true
        end
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.each {|ele| return true if ele == '_' }
        false
    end



end