require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "there is #{@board.num_ships} left"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose, loser'
            return true
        end

        false
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        end
        false
    end


    def game_over?
        if self.lose? || self.win?
            return true
        end
        false
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
            @remaining_misses -= 1
        end
        p "there are #{@remaining_misses} remaining misses"
        @board.print
    end

end
