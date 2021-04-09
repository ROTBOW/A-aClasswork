require 'TDD_project'
require 'towers_of_hanoi'

describe 'my_uniq' do 
    it 'should remove duplicates' do
        expect(my_uniq([1,2,2,3])).to eq([1,2,3]) # do not use Array#uniq
    end
    it 'should not use Array#uniq' do 
        expect(my_uniq([1,2,2,3])).to_not receive(uniq)
    end
end

describe 'two_sum' do 
    it 'should return pairs of indices that equals 0' do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2, 3]])
    end
end

describe 'my_transpose' do 
    # subject(:arr) = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    # subject(:answer) = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]

    it 'should convert the rows of a maxtrix into columns' do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end


describe 'stock_picker' do 
    stock_prices = [ [10, 25], [20, 30], [1, 5] ]
    it 'should output the most profitable pair of days to buy and sell the stock' do
        expect(stock_picker(stock_prices)).to include("the best day to buy is #{1}, and to sell is #{30}")
    end
end

describe 'Towers_of_Hanoi' do 

    subject(:game) { Towers_of_Hanoi.new }

    describe 'sets game' do 
        it 'should have 3 pegs' do 
            expect(game.pegs.size).to eq(3)
        end
        it 'should have 3 discs' do 
            expect(game.pegs.flatten.size).to eq(3)
        end
        it 'discs should be randomly placed' do 
            expect(game.pegs.all? { |peg| peg.size == 1} ).to be true 
        end
    end

    describe 'gets input' do 
        it 'should take input and destination and move the disc' do
            game.swap_disc(1, 2)
            expect(game.pegs).to eq([[1],[],[2,3]])
        end

    end

    describe 'game finish?' do 
        it 'check if game is over?' do 
            game.swap_disc(1, 2)
            game.swap_disc(0, 2)
            expect(game.over?).to be true 
        end
    end

    describe 'play' do 
        it 'should play until game is over' do 
            allow(game.play).to receive(:over?).at_least(2).times
            # (game.play).should_receive(:over?).with(2)

        end
    end
end