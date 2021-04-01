require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'
require 'byebug'

class Game

    def initialize()
        @board = Board.new
        @player_1 = HumanPlayer.new('Fuller', nil)
        @player_2 = ComputerPlayer.new('HAL9000', @board.length)
        @previous_guess = nil
        @players = [@player_1, @player_2]
        @current_player = @players[0]
    end

    def switch_players! 
      @players.rotate! 
      @current_player = @players[0] 
    end

    def over?
        @board.win?
    end
    
    def check_guess(guess) #should always be vaild
      if @previous_guess.nil? 
        @previous_guess = guess
        @board.show_card(@previous_guess)
        @current_player.receive_revealed_card(guess, @board.face(guess))
      else
        @board.show_card(guess)
        if @board.face(@previous_guess) == @board.face(guess)
          reveal_correct_guess(guess)
        else
          hide_incorrect_guess(guess)
        end
      end
    end
    
    def reveal_correct_guess(guess)
      @board.show_card(@previous_guess)
      @board.show_card(guess)
      @previous_guess = nil
    end

    def hide_incorrect_guess(guess)
      system("clear")
      @board.show_card(guess)

      @board.render
      sleep(2)
      system("clear")

      @board.hide_card(@previous_guess)
      @board.hide_card(guess)
      @previous_guess = nil
    end

    def valid_guess?(guess)
      if guess.any? {|num| !(0...@board.length).to_a.include?(num)}
        puts 'invalid guess, remember the format.'
        return false
      end
      
      true
    end
    
    def welcome
      puts 'welcome to memory game'
    end
    
    def run
      self.welcome
      @board.cheat_render
      num_guess = 0
      until over?
          guess = @current_player.prompt
          until valid_guess?(guess)
            guess = @current_player.prompt
          end
          self.check_guess(guess)
          system("clear")
          @board.render
          num_guess += 1

          if num_guess == 2
            num_guess = 0 
            self.switch_players!
          end
      end
  
      puts "YOU WIN #{@current_player.name.upcase}!!!"
    end

  end