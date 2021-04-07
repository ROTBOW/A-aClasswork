class Cursor

    def initialize(position, board)
        @cursor_position = position
        @board = board
    end

    def get_input
        pos = gets.chomp.split(' ').to_i
        return pos
    end

end