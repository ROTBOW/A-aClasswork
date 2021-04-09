def my_uniq(arr)
    answer = []
    arr.each { |ele| answer << ele unless answer.include?(ele) }
    answer 
    # arr.uniq
end

class Array 

    def two_sum
        answers = []

        (0...self.length).each do |idx1|
            (idx1...self.length).each do |idx2|
                 if self[idx1] + self[idx2] == 0 && idx1 != idx2 
                    answers << [idx1, idx2]
                 end
            end
        end 
        answers 
    end

end


def my_transpose(arr)
    arr.transpose
end

def stock_picker(arr)
    best_buy = [10000,0]
    best_sell = [0,0]

    arr.each_with_index do |day, idx|
        best_buy = day if day.first < best_buy.first 
        best_sell = day if day.last > best_sell.last 
    end
    "the best day to buy is #{best_buy.first}, and to sell is #{best_sell.last}"
end