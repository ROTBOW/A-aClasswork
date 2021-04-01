class Board
    attr_reader :size
  
    def initialize(n)
        @grid = Array.new(n) {Array.new(n) {:N}}
        @size = n * n
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        amount = @size / 4
        until amount == 0
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if self[[row, col]] == :N
                amount -= 1
                self[[row, col]] = :S
            end
        end
    end

    def hidden_ships_grid
        temp = Array.new(@grid.size) {Array.new(@grid.size)}
        (0...@grid.size).each do |row|
            (0...@grid.size).each do |col|
                if @grid[row][col] != :S
                    temp[row][col] = @grid[row][col]
                else
                    temp[row][col] = :N
                end
            end
        end
        temp
    end

    def self.print_grid(grid)
        grid.each do |subArr|
            length = subArr.length - 1
            subArr.each_with_index do |ele, idx|
                print ele
                print ' ' if length != idx
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
