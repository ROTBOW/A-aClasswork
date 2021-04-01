require 'set'
require_relative 'player.rb'

class Game

   

    def self.make_dictionary
        dic_file = File.open('./words.txt')
        dic_data = dic_file.readlines.map(&:chomp).to_set
        dic_file.close
        dic_data
    end

    @@dictionary = Game.make_dictionary

    def initialize
        @player_1 = Player.new(:X)
        @player_2 = Player.new(:Y)
        @current_player = @player_1
        @previous_player = nil
        @fragment = ''
        
    end
    
    def play_round
        move = @current_player.take_turn
        while !valid_play?(move)
            puts "Invalid move, enter again: "
            move = @current_player.take_turn
        end 
        @fragment += move
        switch_player
    end

    def lose_check?
       if @@dictionary.include?(@fragment)
        


    end

    def switch_player
        @previous_player = @current_player
        if @current_player == @player_1
            @current_player = @player_2            
        else
            @current_player = @player_1
        end

    end

    def valid_play?(player_input)
        alpha = ('a'..'z').to_a
        temp = @fragment.dup + player_input
        if check_words(temp)
            return true
        end
        false
    end
    
    def check_words(str)
        @@dictionary.each do |ele|
            if ele.start_with? (str)
                return true
            end
        end
        false
    end

end