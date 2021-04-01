def my_map(arr, &prc)
    my_arr = []

    arr.each do |curele|
        temp = prc.call(curele)
        my_arr << temp
    end

    my_arr
end

def my_select (arr, &prc)
    new_arr = []

    arr.each do |item|

        if prc.call(item)
            new_arr << item
        end
        
    end

    new_arr
end


def my_count(arr, &prc)
    count = 0
    arr.each do |item|
        if prc.call(item)
            count += 1
        end
    end
    count
end


def my_any?(arr, &prc)
    arr.each do |item|
        if prc.call(item)
            return true
        end
    end

    false
end

def my_all?(arr, &prc)
    arr.each do |item|
        if !(prc.call(item))
            return false
        end
    end

    true
end


def my_none?(arr, &prc)
    arr.each do |item|
        if prc.call(item)
            return false
        end
    end
    
    true
end

