def average (num1, num2)
    (num1 + num2) / 2.0
end


def average_array (arr)
    sum = 0.0 + arr.sum 
    sum/arr.length
end

def repeat (str, num)
    newStr = ""
    num.times {newStr += str}
    newStr
end

def yell(str)
    str = str.upcase + '!'
end


def alternating_case(string)
    string = string.split(' ')
    string.each_with_index do |curword, idx|
        if idx.even?
            string[idx] = curword.upcase
        else
            string[idx] = curword.downcase
        end
    end
    string = string.join(' ')
end