class Towers_of_Hanoi

    attr_reader :pegs 

    NUMS = [[1,2], [0,2]]

    def initialize(pegs = nil)
        @pegs ||= Array.new(3) { Array.new }
        place_disc
    end

    def place_disc
        discs = [1,2,3]#.shuffle! 
        (0..2).each { |i| @pegs[i] << discs.shift }
    end

    def get_input
        puts "please choose a peg to take a disc from"
        input = gets.chomp.to_i
    end

    def trans_input
        puts "please choose to place the disc"
        input = gets.chomp.to_i
    end

    def swap_disc(num1, num2)
        input_1 = num1 #= get_input
        input_2 = num2 #= trans_input
        @pegs[input_2].unshift(@pegs[input_1].shift)
    end

    def over?
        @pegs.any? { |peg| peg.size == 3 && peg == peg.sort }
    end

    def play
        i = 0
        until over?
            swap_disc(NUMS[i][0], NUMS[i][1])
            i += 1
        end
        puts 'you won! yay...'
    end
end