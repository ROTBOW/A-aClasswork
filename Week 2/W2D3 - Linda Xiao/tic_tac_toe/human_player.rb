class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_pos
        p "Player #{@mark}, please chose a position"
        gets.chomp.split(' ').map(&:to_i)
    end
end