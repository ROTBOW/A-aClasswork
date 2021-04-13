require 'set'

# phase 1

class Integer
    def fact
      (1..self).reduce(:*) || 1
    end
end
  

def first_anagram(str1, str2) # O(n!)
    anagrams = Set.new
    str1 = str1.split('')
    tries = 0
    until anagrams.size == str1.length.fact
        anagrams.add( str1.shuffle.join )
        tries += 1
    end
    # anagrams.include?(str2)
    "I found #{anagrams.size} anagrams!, it took #{tries} tries!"
end

# [1,2,3]
# [3,1,2]
# [1,3,2]
# [2,1,3]
# [2,3,1]
# [3,2,1]

# p first_anagram('dog', 'god')


# phase 2

def second_anagram(str1, str2) # O(n*m) ASK TA 
    str1.each_char do |char|
        return false if str2.index(char) == nil
        str2[str2.index(char)] = ''
    end
    true
end

# p second_anagram('dogeeeeeeeeee', 'god')






def third_anagram(str1, str2) # O(n Log n)
    str1.split('').sort == str2.split('').sort
end

# p third_anagram('dog', 'god')






def fourth_anagram(str1, str2) # O(n+m)
    hash = Hash.new(0)
    str1.each_char do |char|
        hash[char] += 1 
    end

    str2.each_char do |char|
        hash[char] -= 1
    end
    hash.values.all?{ |num| num == 0}
end

# p fourth_anagram('dog', 'god')
