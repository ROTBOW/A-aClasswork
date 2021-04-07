
module Stepper

    KING_MOVES = [[-1,-1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    KNIGHT_MOVES = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    def move_dirs
        # this is sudo code, it will be overwritten in classes
    end

    def moves
        direction = case move_dirs
        when :king
            return step(KING_MOVES)
        when :knight
            return step(KNIGHT_MOVES)
        end
    end

    def step(direction)
        answer = []
        direction.each do |dir|
            x, y = @pos
            next_pos = [(dir[0] + x), (dir[1] + y)]
            next if !(0..7).include?(next_pos[0]) || !(0..7).include?(next_pos[1])
            answer << next_pos
        end
        answer
    end
end