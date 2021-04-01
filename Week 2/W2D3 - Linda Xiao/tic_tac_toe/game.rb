require_relative 'board.rb'
require_relative 'human_player.rb'


class Game

    def initialize(game_size, *players)
        @players = []
        if players.length <= 1
            raise 'you need at least two players!'
        end
        @board = Board.new(game_size)
        players.each {|player| @players << HumanPlayer.new(player) }
        @current_player = @players[0]
    end

    def switch_turn
        @players << @players.shift
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_pos
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "Player #{@current_player.mark} Won!"
                return
            else
                self.switch_turn
            end
        end
        p 'tie!'
    end

end