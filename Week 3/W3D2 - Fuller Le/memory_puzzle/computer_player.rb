class ComputerPlayer
    attr_reader :name 

    def initialize(name, board_size)
        @name = name
        @known_cards = Hash.new {|h, k| h[k] = [] }
        @matched_cards = []
        @board_size = board_size
        @previous_guess = nil
    end

    def receive_revealed_card(pos, val)
      @known_cards[val] << pos 
    end

    def receive_match(pos1, pos2)
      @matched_cards.push(pos1, pos2)
    end

    def prompt
        puts "#{self.name} is guessing:"
        self.get_input
    end

    def get_input 

      if @matched_cards.empty? && @previous_guess.nil?
        return self.random_guess
      elsif @matched_cards.empty? && !@previous_guess.nil?
        
      end

    end

    def random_guess 
        row = rand(0...@board_size)
        col = rand(0...@board_size)

        until !@known_cards.values.include? ([row, col])
            row = rand(0...@board_size)
            col = rand(0...@board_size)
        end

        @previous_guess = [row, col]
        @previous_guess  
    end

end