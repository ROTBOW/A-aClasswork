# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg
# and returns an new array containing the elements that were not
# repeated in the array.

def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1 }
    answer = []
    hash.each {|k,v| answer << k if v == 1 }
    answer
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []





# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that
# accepts an array as an arg. The method should return
# true if an element never appears consecutively in the
# array; it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i + 1]
            return false
        end
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true






# char_indices
# Write a method char_indices(str) that takes in a string as an arg.
# The method should return a hash containing characters as keys. The
# value associated with each key should be an array containing the indices
# where that character is found.

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = [] }
    str.each_char.with_index {|char, idx| hash[char] << idx }
    hash

end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o





# longest_streak
# Write a method longest_streak(str) that accepts a string as
# an arg. The method should return the longest streak of consecutive
# characters in the string. If there are any ties, return the streak
# that occurs later in the string.

def longest_streak(str)
    answer = ''
    current = ''
    str.reverse!

    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            current += str[i]
        else
            current = str[i]
        end

        if current.length > answer.length
            answer = current
        end
    end



    answer
end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'





# bi_prime?
# Write a method bi_prime?(num) that accepts a number
# as an arg and returns a boolean indicating whether or
# not the number is a bi-prime. A bi-prime is a positive
# integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def prime?(number)
    return false if 2 > number
    (2...number).each { |i| return false if number % i == 0 }
    true
end

def list_primes(num)
    answer = []
    i = 1
    until answer.length >= num
        answer << i if prime?(i)
        i += 1
    end
    answer
end

def bi_prime?(number)
    primes = list_primes(number)
    primes.each do |num1|
        primes.each {|num2| return true if num1 * num2 == number }
    end
    false
end


# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false






# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter
# in the word by a fixed number, called the key. Given a key of 3, for
# example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a
# sequence of keys is used. For example, if we encrypt "bananasinpajamas"
# with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a
# key-sequence as args, returning the encrypted message. Assume that the message
# consists of only lowercase alphabetic characters.

def vigenere_cipher(word)

end

# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"







# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg
# and returns the string where every vowel is replaced with the vowel
# the appears before it sequentially in the original string. The first
# vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
    vowels = 'aeuio'
    trackrec = []
    str.each_char.with_index do |letter, idx|
        if vowels.include? letter
            trackrec << letter
            str[idx] = '*'
        end
    end

    trackrec.rotate!(-1)

    str.each_char.with_index do |letter, idx|
        if letter == '*'
            str[idx] = trackrec.shift
        end
    end

    str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String

    def select(&prc)
        return '' if prc == nil
        answer = ''
        self.each_char do |char|
            if prc.call(char) || char == ' '
                answer += char
            end
        end
        answer
    end


    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end

        self
    end

end

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"



# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""








# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
    if b == 0
        return 0
    end

    if a.abs != a && b.abs != b || a.abs == a && b.abs == b
        a, b = a.abs, b.abs
        a + multiply(a, b - 1)
    else
        a, b = a.abs, b.abs
        -(a + multiply(a, b - 1))
    end
end

# # Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


# lucas_sequence
# The Lucas Sequence is a sequence of numbers. The first number
# of the sequence is 2. The second number of the Lucas Sequence is 1.
# To generate the next number of the sequence, we add up the previous two
# numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg.
# The method should return an array containing the Lucas Sequence up to the given length
#  Solve this recursively.

def lucas(n)
    return 2 if n == 0
    return 1 if n == 1
 
    lucas(n - 1) + lucas(n - 2)
end

def lucas_sequence(n)
    return [] if n == 0
    answer = []

    answer += [lucas()]
end

# # Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]