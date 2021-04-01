# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        largest = -1/0.0
        smallest = 1/0.0

        self.each do |number|
            if number > largest
                largest = number
            end
            if number < smallest
                smallest = number
            end
        end
        self.length != 0 ? largest - smallest : nil
    end


    def average
        self.length != 0 ? self.sum.to_f / self.length : nil
    end


    def median
        return nil if self.length == 0
        sorted = self.sort
        if self.length.odd?
            return sorted[self.length / 2]
        else
            first_middle = (self.length / 2) - 1
            second_middle = first_middle + 1
            return (sorted[first_middle] + sorted[second_middle]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(val)
        count = 0
        self.each{|ele| count += 1 if ele == val}
        count
    end

    def my_index(val)
        # return nil if !self.include?(val)
        self.each_with_index{|ele, i| return i if ele == val}
        nil
    end

    def my_uniq
        new_array = []
        self.each do |ele|
            if !new_array.include?(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_transpose
        new_rows = []
        (0...self[0].length).each do |i|
            new_rows << self.map {|arr| arr[i] }
        end
        new_rows
    end

    

end
