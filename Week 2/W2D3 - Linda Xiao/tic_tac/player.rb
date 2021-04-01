class Human
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_pos
        puts "Player #{@mark}, your turn."
        move = gets.chomp.split(' ').map(&:to_i)
    end

end