require_relative './card.rb'

class Board 

  def initialize(size=2)
    @grid = Array.new(size) {Array.new(size)}
    @size = size * size
    self.populate
  end

  def length 
    @grid.length 
  end

  def [](pos)
    row, col = pos 
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    @grid[row][col] = val 
  end 


  def populate 
    alpha = ("a".."z").to_a   

    alpha.each do |letter|
        2.times do
        while true
            row = rand(0...@grid.length)
            col = rand(0...@grid.length) 
            if self[[row,col]].nil? 
               self[[row,col]] = Card.new(letter)
                break
            end
        end
      end

      break if @grid.flatten.count {|card| card.is_a?(Card) } == @size
    end
  end

  def cheat_render
    puts '-' * @size
    puts "  #{(0...@grid.size).to_a.join(" ")}"
    @grid.each_with_index {|sub, idx| puts "#{idx.to_s} #{sub.map(&:cheat).join(" ")}" }

    puts '-' * @size

  end

  def render
    puts '-' * @size
    puts "  #{(0...@grid.size).to_a.join(" ")}"
    @grid.each_with_index {|sub, idx| puts "#{idx.to_s} #{sub.map(&:face).join(" ")}" }

    puts '-' * @size
  end

  def win? 
    @grid.flatten.none? {|card| card.face == ' ' }
  end


  def show_card(pos)
    if self[pos].face == ' '
      self[pos].reveal 
      return self[pos]
    end

  end

  def face(pos)
    self[pos].face
  end

  def hide_card(pos)
    unless self[pos].face == ' '
      self[pos].hide
    end
  end

end