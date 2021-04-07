require_relative "./board.rb"
require_relative './cursor.rb'

class Display

    def initialize(board)
        @board = board
    end

    def render
        print "  #{(0..7).to_a.join(' ')}"
        print "\n"
        @board.rows.each_with_index do |row, idx|
            print "#{idx} #{row.map(&:face).join(' ')} \n"
        end

    end

end

b = Board.new
d = Display.new(b)
d.render
# puts
# puts
# b.move_piece([1,1], [2,2])
# d.render
# puts '-' * 24
# b.move_piece([1,0], [1,1])
# d.render