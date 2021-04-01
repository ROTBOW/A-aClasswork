
# :array_1) { ['a', 'b', 'c'] }
# :array_2) { [1, 2, 3] }

def zip(*arr)
    new_arr = []

    arr[0].each.with_index do |ele, idx| # ['a', 'b', 'c'] 
        temp_arr = []
        i = 0
        while i < arr.length  #i = 0  i = 1
            temp_arr << arr[i][idx]  # temp_arr = [arr[0][0] #arr[1][0]]
            i += 1
        end
        new_arr << temp_arr
    end
    new_arr
end




def prizz_proc(arr, prc1, prc2)
    new_arr = []

    arr.each do |ele|
        new_arr << ele if (!prc1.call(ele) && prc2.call(ele)) || (prc1.call(ele) && !prc2.call(ele) )

    end

    new_arr
end
require 'byebug'


def zany_zip(*arr)
    #debugger
    new_arr = []
    
    mad_max = arr.map {|ele| ele.length }.max

    (0...mad_max).each do |idx| # ['a', 'b', 'c']  #idx = 2
        #debugger
        temp_arr = []
        i = 0
        while i < arr.length  #i = 0  i = 1  #2 < 3
            #debugger

            if idx >= arr[i].length  # (2 +1) >= 3 when idx = 2 and i = 2
                temp_arr << nil
            else
                temp_arr << arr[i][idx]  # temp_arr = [arr[0][0] #arr[1][0]]
            end
            i += 1
        end
        new_arr << temp_arr
    end
    new_arr
end

# array_1 = ['a', 'b', 'c']
# array_2 = [1, 2, 3]
# array_3 = [11, 13, 15, 17]

# p zany_zip(array_1, array_2, array_3)

def maximum( arr, &prc )
    return nil if arr.length == 0

    test_case = arr.inject(0) {|x,ele| x = prc.call(ele) if prc.call(ele) > x }
    p test_case
    arr.reverse.each do |ele|
        if prc.call(ele) == test_case
            return ele
        end
    end

end


def my_group_by(arr, &prc)
    hash = Hash.new {|h, k| h[k] = [] }

    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end

    hash
end




def max_tie_breaker(arr,prc,&block)
    return nil if arr.length == 0
    
    hash = my_group_by(arr, &block)
    target = hash.keys.max
    return hash[target][0] if hash[target].length == 1
    
    my_hash_2 = my_group_by(hash[target],&prc)
    target = hash.keys.max
    return hash[target][0] if hash[target].length == 1

    return hash[target][0]


end


array_1 = ['potato', 'swimming', 'cat']
array_2 = ['cat', 'bootcamp', 'swimming', 'ooooo']
array_3 = ['photo','bottle', 'bother']
length =  Proc.new { |s| s.length }
o_count =  Proc.new { |s| s.count('o') }

# p max_tie_breaker(array_2, o_count, &length)

# first run
# ["swimming"]
# {6=>["potato"], 8=>["swimming"], 3=>["cat"]}


# ["bootcamp", "swimming"]
# {3=>["cat"], 8=>["bootcamp", "swimming"], 5=>["ooooo"]}

def vowel_count(str)
    count = 0
    vowels = "aeiou"
    str.each_char {|char| count += 1 if vowels.include?(char) }
    count
end



def silly_syllables(words)
    vowels = 'aueio'
    words_arr = words.split(' ')
    new_arr = []


    words_arr.each do |word|
        
        if vowel_count(word) < 2
            new_arr << word
            next
        end

        first_vowel_idx = ''
        last_vowel_idx = ''

        word.each_char.with_index do |letter, idx|
            if vowels.include? letter
                first_vowel_idx = idx
                break
            end
        end

        word.reverse.each_char.with_index do |letter, idx|
            if vowels.include? letter
                last_vowel_idx = word.length - idx
                break
            end
        end

        new_word = word[first_vowel_idx..last_vowel_idx - 1]
        new_arr << new_word
    end

    new_arr.join(' ')
end

