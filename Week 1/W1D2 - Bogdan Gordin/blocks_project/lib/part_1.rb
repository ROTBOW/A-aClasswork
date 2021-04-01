
def select_even_nums(arr)
    arr.select {|num| num.even?}
end

def reject_puppies(arr)
    arr.reject { |dog| dog['age'] <= 2}
end

def count_positive_subarrays (arr)
    arr.count {|array| array.sum > 0 }
end

def aba_translate(str)
    vowels = 'aeiuo'
    newStr = ''
    str.each_char do |letter|
        if vowels.include? letter
            newStr += letter + 'b' + letter
            next
        end
        newStr += letter
    end
    newStr
end


def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end

