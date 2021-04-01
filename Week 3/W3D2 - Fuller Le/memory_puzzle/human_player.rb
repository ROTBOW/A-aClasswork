class HumanPlayer
    attr_reader :name

    def initialize(name, board_size)
        @name = name
    end

    def prompt
        puts 'Enter two numbers with a comma in between'
        self.get_input
    end

    def get_input
        gets.chomp.split(',').map(&:to_i)
    end

    def receive_revealed_card(pos, val) 
    end 

    def receive_match(pos1, pos2)
    end
end