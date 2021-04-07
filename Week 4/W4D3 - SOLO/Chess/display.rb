require_relative "./board.rb"

class Display

    def initialize(board)
        @board = board
    end

    def render
        @board.rows.each do |row|
            row.each do |cel|
                print "#{cel.face}".ljust(2)
            end
            print "\n"
        end

    end




end

b = Board.new
d = Display.new(b)
d.render
# puts
# puts
# b.move_piece([1,3], [2,3])
# d.render