def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1,idx1|
        arr.each_with_index do |ele2,idx2|
            if idx1 < idx2
                return true if ele1 + ele2 == target_sum
            end
        end
    end
    false
end
        #   *  *
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum) # O( n Log n)
    arr.sort! #O(n Log n)
    mid = arr.size/2
    pointer1 = 0
    pointer2 = (arr.length-1)
    until pointer1 == pointer2
        case arr[pointer1] + arr[pointer2] <=> target_sum
        when 0
            return true
        when 1
            pointer2 -= 1
        when -1
            pointer1 += 1
        end
    end
    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# 0   7 =   7 != 6    7 > 6
# 0   5 =   5 != 6    5 < 6
# 1   5 =   6== 6     6 = 6

# we are comparing the ends of the sorted array 



def two_sum?(arr, target_sum) # O(n + n)
    hash = Hash.new(0)
    arr.each do |ele|
        return true if hash.has_value?(ele)
        hash[ele] = target_sum - ele
    end
    false
end



arr = [0, 1, 5, 7]

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false