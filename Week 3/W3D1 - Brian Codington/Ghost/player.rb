class Player
    attr_reader :name

    def initialize(name)
        @name = name
        @record = ""
    end

    
    def take_turn
        p "Enter char: "
        player_move = gets.chomp
        player_move
    end


end