# duos
# Write a method duos that accepts a string as an argument
# and returns the count of the number of times the same character
# appears consecutively in the given string.

def duos(str)
    count = 0
    (0...str.length-1).each do |i|
        if str[i] == str[i+1]
            count += 1
        end
    end
    return count
end

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


# sentence_swap
# Write a method sentence_swap that accepts a sentence
# and a hash as arguments. The method should return a new
# sentence where every word is replaced with it's corresponding
# value in the hash. If a word does not exist as a key of the hash,
# then it should remain unchanged.


def sentence_swap(words, hash)

    final_arr = []
    words_arr = words.split(' ')
    words_arr.each do |word|
        if hash.has_key? (word)
            final_arr << hash[word]
        else
            final_arr << word
        end
    end
    final_arr.join(' ')
end


# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# "nothing you shall drink I shall drink"
# "make a happy ad"
# "keep running okay"





# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc,
# and a block. The method should return a new hash where each
# key is the result of the original key when given to the block.
# Each value of the new hash should be the result of the original
# values when passed into the proc.

def hash_mapped(hash, prc, &block)

    new_hash = {}
    hash.each do |k,v|
        new_hash[block.call(k)] = prc.call(v)
    end
    new_hash
end

#Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' } == {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n } == {25=>"q", 36=>"w"}
# # {25=>"q", 36=>"w"}





#counted_characters

# Write a method counted_characters that accepts a string as
# an argument. The method should return an array containing the
# characters of the string that appeared more than twice. The
# characters in the output array should appear in the same order
# they occur in the input string.

def counted_characters(str)
    new_arr = []
    new_hash = Hash.new(0)
    str.each_char do |char|
        new_hash[char] += 1
    end

    new_hash.each do |k, v|
        if v > 2
            new_arr << k
        end
    end
    new_arr
end

# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# triplet_true?

# Write a method triplet_true? that accepts a string as an argument 
# and returns a boolean indicating whether or not the string contains 
# three of the same character consecutively.

def triplet_true(str)
    false if str.length < 3
    (0...str.length-2).each do |i|
        if str[i] == str[i+1] && str[i] == str[i+2]
            return true
        end
    end
    false
end

# Examples

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# energetic_encoding

# # Write a method energetic_encoding that accepts a string and a hash 
# as arguments. The method should return a new string where characters 
# of the original string are replaced with the corresponding values in 
# the hash. If a character is not a key of the hash, then it should be 
# replaced with a question mark ('?'). Space characters (' ') should 
# remain unchanged.

def energetic_encoding(str,hash)
    answer = ""
    hash[" "] = " "
    str.split("").each do |char|
        # if char == " "
        #     answer << char
        #     next
        # end
        if hash.keys.include?(char)
            answer << hash[char]
        else
            answer << "?"
        end
    end
    answer
end

# # Examples
# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# "zimp ziu"
# "ko?"
# "?arri ?i?r?"
# "????"

# "zimp ziu"
# "ko?"
# "?arri ?i?r?"
# "????"


# uncompress
# Write a method uncompress that accepts a string as an argument.
# The string will be formatted so every letter is followed by a number.
# The method should return an "uncompressed" version of the string where
# every letter is repeated multiple times given based on the number that
# appears directly after the letter.

def uncompress(str)
    numbers = '1234567890'
    new_str = ''
    str.each_char.with_index do |char, i|
         if numbers.include? char
             (char.to_i).times { new_str += str[i - 1] }
        end
    end
    new_str
end

# Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'






# conjunct_select
# Write a method conjunct_select that accepts an array
# and one or more procs as arguments. The method should
# return a new array containing the elements that return
# true when passed into all of the given procs.


def conjunct_select(arr, *prc_arr)
    new_arr = []

    arr.each do |ele|
        count = 0
        prc_arr.each do |prc|
            count += 1 if prc.call(ele)
        end
        new_arr << ele if count == prc_arr.length
    end

    new_arr
end

#Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]




# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an
# argument. The method should translate the sentence according to
# the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the
# end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated
# sentence. Vowels are the letters a, e, i, o, u.

def third_case(str)
    vowels = 'aeoiuAIEOU'
    str.each_char.with_index do |char, idx|    
        if vowels.include? char
            return str[idx..-1] + str[0...idx] + 'ay'
        end
    end
end



def convert_pig_latin(words)
    vowels = 'aeoiuAIEOU'
    final_arr = []
    words_arr = words.split(' ')

    words_arr.each do |word|
        if word.length < 3
            final_arr << word
            next
        end

        if vowels.include? word[0] 
            final_arr << word + 'yay'
            next
        end
        
        if !vowels.include? word[0]
             final_arr << third_case(word)            
        end
    end
    final_arr.join(' ').capitalize
end

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# # Correct
# # "We ikelay to eatyay ananasbay"
# "We ikelay to eatyay ananasbay"
# "I annotcay indfay ethay ashtray"
# "Atwhay an interestingyay oblempray"
# "Erhay amilyfay ewflay to ancefray"
# "Ouryay amilyfay ewflay to ancefray"



# reverberate
# Write a method reverberate that accepts a sentence as an argument.
# The method should translate the sentence according to the following
# rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel,
#     including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in
# the translated sentence. Vowels are the letters a, e, i, o, u.

def work_case(str) # fast
    vowels = 'aeoiuAIEOU'
    str = str.reverse # tsaf
    answer = ''
    str.each_char.with_index do |char, idx|    
        if vowels.include? char # tsaf
            answer = str[0..idx] + str
            return answer.reverse
        end
    end
end # fastast


def reverberate(words)

    vowels = 'aeoiuAIEOU'
    final_arr = []
    words_arr = words.split(' ')

    words_arr.each do |word|
        if word.length < 3
            final_arr << word
            next
        end

        if vowels.include? word[-1].downcase
            final_arr << word + word
            next
        end
        
        if !vowels.include? word[-1]
             final_arr << work_case(word)            
        end
    end
    final_arr.join(' ').capitalize

end

# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# "We likelike to go runningunning fastast"
# "He cannotannot findind thethe trashash"
# "Pastapasta is my favoritefavorite dishish"
# "Herer familyamily flewew to francefrance"







# reverberate
# Write a method reverberate that accepts a sentence as an argument.
# The method should translate the sentence according to the following
# rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel,
#     including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized
# in the translated sentence. Vowels are the letters a, e, i, o, u.

def reve_third(str)
    vowels = 'aeuio'
    answer = ''
    str = str.reverse
    str.each_char.with_index do |letter, idx|
        if vowels.include? letter
            answer = str[0..idx] + str
            return answer.reverse
        end
    end
end

def reverberate(string)
    answer = []
    vowels = 'aeuio'
    string.split(' ').each do |word|
        if word.length < 3
            answer << word
            next
        end
        
        if vowels.include? word[-1]
            answer << word + word.downcase
        else
            answer << reve_third(word)
        end
    end

    answer.join(' ')
end

# Examples

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') == "Herer familyily flewew to Francefrance"
# "We likelike to go runninging fastast"
# "He cannotot findind thethe trashash"
# "PastaPasta is my favoritefavorite dishish"
# "Herer familyily flewew to FranceFrance"




# disjunct_select
# Write a method disjunct_select that accepts an array and one
# or more procs as arguments. The method should return a new array
# containing the elements that return true when passed into at least
# one of the given procs.


def disjunct_select(arr, *prcs)
    answer = []
    arr.each do |ele|
        prcs.each do |prc|  
            if prc.call(ele)
                answer << ele
                break
            end
        end
    end
    answer
end


# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]




# alternating_vowel
# Write a method alternating_vowel that accepts a sentence
# as an argument. The method should return a new sentence
# where the words alternate between having their first or
# last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged.
# Vowels are the letters a, e, i, o, u.
def count_vowels(str)
    vowels = 'aeuio'
    count = 0
    str.each_char {|letter| count += 1 if vowels.include? letter }
    count
end

def str_delete_at(str, idx)
    str = str.split('')
    str.delete_at(idx)
    str.join('')
end

def get_first_vowel_index(str)
    vowels = 'aeuio'
    str.each_char.with_index {|letter, idx| return idx if vowels.include? letter }
end


def alternating_vowel(string)
    answer = []
    string.split(' ').each_with_index do |word, idx|

        if count_vowels(word) == 0
            answer << word
            next
        end

        if idx.even?
            answer << str_delete_at(word, get_first_vowel_index(word))
        else
            word.reverse!
            word = str_delete_at(word, get_first_vowel_index(word))
            word.reverse!
            answer << word
        end
    end

    answer.join(' ')
end


# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"




# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. The method should
# translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word
#     (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and
#     that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized
# in the translated sentence. Vowels are the letters a, e, i, o, u.

def vowel_boo(str)
    vowels = 'aeuio'
    answer = ''
    str.each_char do |letter| 
        if vowels.include? letter.downcase
            answer << letter + 'b' + letter.downcase
        else
             answer << letter
        end
    end
    answer
end


def silly_talk(string)
    vowels = 'aeuio'
    answer = []
    string.split(' ').each do |word|
        if vowels.include? word[-1]
            answer << word + word[-1]
            next
        end
        answer << vowel_boo(word)
    end
    answer.join(' ')
end

# Examples

# p silly_talk('Kids like cats and dogs') == "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') == "Stobop thabat scobooboteber"
# p silly_talk('They can code') == "Thebey caban codee"
# p silly_talk('He flew to Italy') == "Hee flebew too Ibitabaly"



# compress
# Write a method compress that accepts a string as an argument.
# The method should return a "compressed" version of the string
# where streaks of consecutive letters are translated to a single
# appearance of the letter followed by the number of times it
# appears in the streak. If a letter does not form a streak
# (meaning that it appears alone), then do not add a number after it.


def compress(str)
    answer = ''
    count = 0
    testcase = str[0]
    str << '*' # this is needed bc the code will end prematurely without it, it doesn't get into the return variable though.
    str.each_char do |letter|
        if testcase == letter
            count += 1
            next
        else
            if count > 1
                answer << testcase + count.to_s
                testcase = letter
                count = 1
            else
                answer << testcase
                testcase = letter
                count = 1
            end
        end
    end
    
    answer
end

# Examples

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"