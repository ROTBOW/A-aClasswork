# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(number)
    return false if number < 2
    (2...number).each {|i| return false if number % i == 0 }
    true
end

def factors(number)
    answer = []
    (1..number).each {|i| answer << i if number % i == 0 }
    answer
end

def largest_prime_factor(n)
    factors_arr = factors(n)
    factors_arr.reverse!
    factors_arr.each {|ele| return ele if prime?(ele) }
end




def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char {|letter| hash[letter] += 1 }
    if hash.values.include? 2
        return false
    end
    true
end


def dupe_indices(arr)
    hash = {}
    dups = arr.select {|ele| arr.count(ele) > 1 }
    dups.uniq!

    dups.each {|ele| hash[ele] = [] }

    arr.each_with_index do |ele, idx|
        if dups.include? ele
            hash[ele] << idx
        end
    end
    hash
end



def ana_array(arr1, arr2)
    hash = Hash.new(0)
    arr2.each {|ele| hash[ele] += 1 }

    hash.each do |k, v|
        if arr1.count(k) != v
            return false
        end
    end

    hash = Hash.new(0)
    arr1.each {|ele| hash[ele] += 1 }

    hash.each do |k, v|
        if arr2.count(k) != v
            return false
        end
    end

    true
end