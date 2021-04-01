def reverser(str, &prc)
    prc.call(str.reverse)
end


def word_changer(string, &prc)
    newArr = []
    string = string.split(" ")
    string.each do |word|
        newArr << prc.call(word)
    end

    newArr.join(" ")
end

def greater_proc_value(num, prc1, prc2)

    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end

end

def and_selector(arr, prc1, prc2)
    newArr = []

    arr.each do |item|
        if prc1.call(item) && prc2.call(item)
            newArr << item
        end
    end

    newArr
end

def alternating_mapper(array, prc1, prc2)
    arrnew = []

    array.each_with_index do |el, idx|
        if idx.even?
            arrnew << prc1.call(el)
        else
            arrnew << prc2.call(el)
        end
    end

    arrnew
end
