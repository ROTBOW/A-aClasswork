require_relative 'board.rb'
require_relative 'player.rb'

class Game

    def initialize(size=3, *marks)
        @board = Board.new(size)
        @players = []
        marks.each {|mark| @players << Human.new(mark) }
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
                puts "Player #{@current_player.mark} Won!"
                return
            else
                switch_turn
            end
        end
        puts 'its a draw!'
    end

end