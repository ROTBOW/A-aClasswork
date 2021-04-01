puts "---STRANGE NUMBERS---"
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that 
# have a sum of zero. You may assume that the input array contains unique elements.

def strange_sums(arr)
  # iterate arr, nested in iterate arr
  # each pair, if sum is zero, increase count by 1
  count = 0

  arr.each.with_index do |num1, idx1|
    arr.each.with_index do |num2, idx2|
      if idx2 > idx1 && num1 + num2 == 0
        count += 1
      end
    end
  end

  count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0


puts
puts
puts "---PAIR PRODUCT---"
# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements 
# in the array result in the product when multiplied together. 
# You may assume that the input array contains unique elements.


def pair_product(arr, prod)
  
    arr.each.with_index do |num1, idx1|
    arr.each.with_index do |num2, idx2|
      if idx2 > idx1 && num1 * num2 == prod
        return true
      end
    end
  end

  false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false


puts
puts
puts "---RAMPANT REPEATS---"
# Write a method rampant_repeats that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string
# are repeated the number of times specified by the hash. If a character does not
# exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
  # loop through str chars, if char is a hash key, multiply by that keys value, and add
  # if not a key, add as-is
  new_str = ""

  str.each_char do |letter|
    if hash.has_key?(letter)
      new_str += letter * hash[letter]
    else
      new_str += letter
    end
  end
  new_str
end


p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


puts
puts
puts "---PERFECT SQUARE---"
# Write a method perfect_square?? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument is a 
# perfect square. A perfect square is a number that is the product of some number 
# multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 
# 35 is not a perfect square.

def perfect_square?(num)
  Integer.sqrt(num) == Math.sqrt(num)
end

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false


puts
puts
puts "---ANTI-PRIME---"
# Write a method anti_prime? that accepts a number as an argument. The method should return
# true if the given number has more divisors than all positive numbers less than the given number.
# For example, 24 is an anti-prime because it has more divisors than any positive number less than 24.
# Math Fact: Numbers that meet this criteria are also known as highly composite numbers.


def anti_prime? (num)
    # make a helper, that makes an array of all factors of num [1, 2, 3, 4, 5, 6, 8, 12, 24]
    # if I compare the factors array to every array up to it, it's length should be longer.
    # range 0 to num

    (1...num).each do |idx|
        if factors(num).length < factors(idx).length
            return false
        end
    end
    true
end

def factors (number)
    arr = []
    (1..number).each do |pos_fac|
        if number % pos_fac == 0
            arr << pos_fac
        end
    end
    arr
end


p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false


puts
puts
puts "---MATRIX ADDITION---"
# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a
# method matrix_addition that accepts two matrices as arguments.
# The two matrices are guaranteed to have the same "height" and "width".
# The method should return a new matrix representing the sum of the two arguments.
# To add matrices, we simply add the values at the same positions:
# programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]
# structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7

def matrix_addition (arr1, arr2)
    new_arr = []
    arr1.each.with_index do|subarr1, idx1|
      new_sub = []
        subarr1.each.with_index do |num1, idx2|
            new_sub << arr1[idx1][idx2] + arr2[idx1][idx2]
        end
      new_arr << new_sub
    end

    new_arr
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


puts
puts
puts "---MUTUAL FACTORS---"
# Write a method mutual_factors that accepts any amount of numbers as arguments. 
# The method should return an array containing all of the common divisors shared 
# among the arguments. 
# For example, the common divisors of 50 and 30 are 1, 2, 5, 10. 
# You can assume that all of the arguments are positive integers.

def mutual_factors(*nums)

  hash = Hash.new(0)
  new_arr = []
  return_arr = []

  nums.each do |num|
    new_arr << factors(num) # this would give one array of all divisors of that number
  end
  new_arr = new_arr.flatten # one array of all the factors for all teh nums

  new_arr.each do |factor|
    hash[factor] += 1
  end
  
  hash.each do |k, v|
    if v == nums.length
      return_arr << k
    end
  end

  return_arr

end


p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]


puts
puts
puts "---TRIBONACCI SEQUENCE---"
# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the previous three numbers. 
# The first six numbers of tribonacci sequence are:
# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and 
# returns the n-th number of the tribonacci sequence.

def tribonacci_number(n)

  return 1 if n == 1
  return 1 if n == 2
  return 2 if n == 3

  arr = [1, 1, 2]
  (4..n).each do |num|
    arr << arr[-1] + arr[-2] + arr[-3]
  end

  arr[-1]
end


p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274


puts
puts
puts "---MATRIX ADDITION RELOADED---"
# Write a method matrix_addition_reloaded that accepts
# any number of matrices as arguments. The method should return
# a new matrix representing the sum of the arguments. Matrix addition
# can only be performed on matrices of similar dimensions, so if all of
# the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matrix) # collapses args into one array - extra outer [] shell 
  if matrix_counter(matrix) == false
    return nil
  end

  if matrix.length == 1
    return matrix[0]
  end

  
  (1...matrix.length).each do |number|
    matrix[0] = matrix_addition(matrix[0], matrix[number])
  end

  matrix[0]
end


def matrix_counter(matrix) #(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
  key = matrix[0].length

  matrix.each do |mat_arr|
    if mat_arr.length != key
      return false
    end
  end
  return true
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]


p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


puts
puts
puts "---SQUAROCOL VERSION ONE---"
# Write a method squarocol? that accepts a 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not any row or column is 
# completely filled with the same element. You may assume that the 2-dimensional array 
# has "square" dimensions, meaning it's height is the same as it's width.
# require 'byebug'

def squarocol?(arr)
  vert_test = false
  horz_test = false

  arr.each do |sub_arr| # [:x, :y, :x]
    horz_test = sub_arr.all? {|el| el == sub_arr[0]}
    return true if horz_test == true
  end

  columns = arr.transpose
  columns.each do |sub_arr| # [:x, :y, :x]
    vert_test = sub_arr.all? {|el| el == sub_arr[0]}
    return true if vert_test == true
  end

  false
end  

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false




# puts
# puts
# puts "---SQUAROCOL VERSION TWO---"
# demoed version from class
def horzvert?(tdarr)
  tdarr.each do |sub|
    if sub.uniq.length == 1
      return true
    end
  end

  tdarr.transpose.each do |sub|
    if sub.uniq.length == 1
      return true
    end
  end

  false
end

# p horzvert?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p horzvert?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p horzvert?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p horzvert?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p horzvert?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


# 0,0  0,1  0,2  0,3
# 1,0  1,1  1,2  1,3
# 2,0  2,1  2,2  2,3
# 3,0  3,1  3,2  3,3


# puts
# puts
# puts "---SQUARAGONAL VERSION ONE---"
# puts "NOT FINISHED - WRONT ANSWER ON LAST TEST"
# Write a method squaragonal? that accepts 2-dimensional array
# as an argument. The method should return a boolean indicating whether
# or not the array contains all of the same element across either of its
# diagonals. You may assume that the 2-dimensional array has "square" dimensions,
# meaning it's height is the same as it's width.

def squaragonal? (arr)
  diagonal1 = []
  diagonal2 = []

  arr.each_with_index do |sub_arr,  idx1| # diagonal 1 is idx1 = idx2
    sub_arr.each_with_index do |ele, idx2|
      if idx1 == idx2
        diagonal1 << arr[idx1][idx2]
      end
    end
  end

    arr.each_with_index do |sub_arr,  idx1| # diagonal 2 is idx1 + idx2 = array.length -1
    sub_arr.each_with_index do |ele, idx2|
      if idx1 + idx2 == arr.length-1
        diagonal1 << arr[idx1][idx2]
      end
    end
  end

  
  diag1_test = diagonal1.all? {|el| el == diagonal1[0] }
  diag2_test = diagonal2.all? {|el| el == diagonal1[0] }


  diag1_test == true || diag2_test == true

end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


puts
puts
puts "---SQUARAGONAL VERSION TWO---"
#demoed version from class

def diag?(twod_arr)
  first_diag = []
  second_diag = [] # two arrays for later storage

  (0...twod_arr.length).each do |idx| # looping though the length of the array
    first_diag << twod_arr[idx][idx] # storeing the first diag, it's easy since its index will always be the same
    second_diag << twod_arr[idx][twod_arr.length - 1 -idx] #second diag, this is the invert of 
  end

  first_diag.uniq.length == 1 || second_diag.uniq.length == 1
end


p diag?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p diag?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p diag?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p diag?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false






puts
puts
puts '---PASCALS TRIANGLE---'
# Write a method pascals_triangle that accepts a positive
# number, n, as an argument and returns a 2-dimensional array
# representing the first n levels of pascal's triangle.
# every row is 11^n where n is the row num


def adjacent_sums(arr)
  result = []
  (0...arr.length - 1).each do |i|
    result << arr[i] + arr[i + 1]
  end

  result
end

def pascals_triangle(n)
  tri = [[1]]

  until tri.length == n
    up_level = tri.last
    tri_new = [1]
    tri_new += adjacent_sums(up_level)
    tri_new << 1
    tri << tri_new
  end

  tri
end


# Examples

test1 = pascals_triangle(5)
p test1[0]
p test1[1]
p test1[2]
p test1[3]
p test1[4]
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

puts
puts

test2 = pascals_triangle(7)
p test2[0]
p test2[1]
p test2[2]
p test2[3]
p test2[4]
p test2[5]
p test2[6]
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]







puts
puts
puts '---MERSENNE PRIME---'
# mersenne_prime
# A "Mersenne prime" is a prime number that is one
# less than a power of 2. This means that it is a prime
# number with the form 2^x - 1, where x is some exponent.
# For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that accepts a
# number, n, as an argument and returns the n-th Mersenne prime.

def prime?(number)
  return false if 2 > number
  (2...number).each { |i| return false if number % i == 0 }
  true
end


def mersenne_prime(n)
  mersenne = []
  i = 0

  until mersenne.length >= n
    mersenne << ((2 ** i) - 1) if prime?((2 ** i) - 1)
    i += 1
  end

  mersenne.last
end

# Examples

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

# just some personal testing hehe
# p prime?(1) # false
# p prime?(2) # true
# p prime?(3) # true
# p prime?(4) # false
# p prime?(5) # true
# p prime?(6) # false
# p prime?(7) # true











puts
puts
puts '---TRIANGULAR WORD---'
# triangular_word?
# A triangular number is a number of the form (i * (i + 1)) / 2
# where i is some positive integer. Substituting i with increasing
# integers gives the triangular number sequence. The first five numbers
# of the triangular number sequence are 1, 3, 6, 10, 15. Below is a breakdown
# of the calculations used to obtain these numbers:

# i	(i * (i + 1)) / 2
# 1	1
# 2	3
# 3	6
# 4	10
# 5	15
# We can encode a word as a number by taking the sum of its letters based on
# their position in the alphabet. For example, we can encode "cat" as 24 because
# c is the 3rd of the alphabet, a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? that accepts a word as an argument and
# returns a boolean indicating whether or not that word's number encoding is a
# triangular number. You can assume that the argument contains lowercase letters.

def letter_to_place(str)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  arr = []
  str.each_char {|letter| arr <<  alphabet.index(letter) + 1}
  arr
end

def tri_math(num)
  result = []
  i = 0
  until i >= num
    result << (i * (i + 1)) / 2
    i += 1
  end
  result
end


def triangular_word?(str)
  number = letter_to_place(str).sum
  tri_arr = tri_math(number)
  tri_arr.include? number
end

# Examples

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false










puts
puts
puts '---CONSECUTIVE COLLAPSE---'
# consecutive_collapse
# Write a method consecutive_collapse that accepts an array
# of numbers as an argument. The method should return a new
# array that results from continuously removing consecutive
# numbers that are adjacent in the array. If multiple adjacent
# pairs are consecutive numbers, remove the leftmost pair first.
# For example:

# [3, 4, 1] -> [1]
# because 3 and 4 are consecutive and adjacent numbers, so we can remove them
# [1, 4, 3, 7] -> [1, 7]
# because 4 and 3 are consecutive and adjacent numbers, so we can remove them
# [3, 4, 5] -> [5]
# because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5
# since we should prefer to remove the leftmost pair
# We can apply this rule repeatedly until we cannot collapse the array any further:


def consecutive_collapse(arr)
  
  solved = false

	until solved
		solved = true
    temp_arr = []

		(0...arr.length - 1).each do |i|
      next if arr[i] == nil

			if arr[i] + 1 == arr[i + 1] || arr[i] - 1 == arr[i + 1]

				arr[i], arr[i + 1] = nil, nil

				solved = false
			end

		end
    arr.delete(nil)
	end

  arr

end



# example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]
#Code examples

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []







puts
puts
puts '---PRETENTIOUS PRIMES---'
# pretentious_primes
# Write a method pretentious_primes that takes accepts an array and a number, n,
# as arguments. The method should return a new array where each element of the
# original array is replaced according to the following rules:

# when the number argument is positive, replace an element with the n-th nearest
# prime number that is greater than the element
# when the number argument is negative, replace an element with the n-th nearest
# prime number that is less than the element
# For example:

# if element = 7 and n = 1, then the new element should be 11 because 11 is the
#   nearest prime greater than 7
# if the element = 7 and n = 2, then the new element should be 13 because 13 is
#   the 2nd nearest prime greater than 7
# if the element = 7 and n = -1, then the new element should be 5 because 5 is
#   the nearest prime less than 7
# if the element = 7 and n = -2, then the new element should be 3 because 3 is
#   the 2nd nearest prime less than 7
# Note that we will always be able to find a prime that is greater than a given
# number because there are an infinite
# number of primes (this is given by Euclid's Theorem). However, we may be unable
# to find a prime that is smaller than a given number, because 2 is the smallest
# prime. When a smaller prime cannot be calculated, replace the element with nil.

# I made a prime? method higher in the code.
# okay, so this is the solution.
# I've read it over like four times now and I starting to get it.
# just got the problem is asking for the nth prime from the number. *sigh*

def next_prime(number, i)

  step = 1
  if i < 0
    i = -(i)    # this section of code will invert the step and i if the given i is neg
    step = -(step)
  end

  prime_count = 0
  while prime_count < i # okay so we keep count of the amount of primes we been been through
    return nil if number < 0 # then we check if our num is less then 0, note this will never happen during the first loop
    number += step
    prime_count += 1 if prime?(number)
  end

  number
end


def pretentious_primes(arr, n)
  arr.map { |ele| next_prime(ele, n) }
end





# Examples

p pretentious_primes([4, 15, 7], 1)  == [5, 17, 11]
p pretentious_primes([4, 15, 7], 1)

p pretentious_primes([4, 15, 7], 2)  == [7, 19, 13]
p pretentious_primes([4, 15, 7], 2)

p pretentious_primes([12, 11, 14, 15, 7], 1)  == [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 1)

p pretentious_primes([12, 11, 14, 15, 7], 3)  == [19, 19, 23, 23, 17]
p pretentious_primes([12, 11, 14, 15, 7], 3)

p pretentious_primes([4, 15, 7], -1) == [3, 13, 5]
p pretentious_primes([4, 15, 7], -1)

p pretentious_primes([4, 15, 7], -2) == [2, 11, 3]
p pretentious_primes([4, 15, 7], -2)

p pretentious_primes([2, 11, 21], -1)  == [nil, 7, 19]
p pretentious_primes([2, 11, 21], -1)

p pretentious_primes([32, 5, 11], -3)  == [23, nil, 3]
p pretentious_primes([32, 5, 11], -3)

p pretentious_primes([32, 5, 11], -4)  == [19, nil, 2]
p pretentious_primes([32, 5, 11], -4)

p pretentious_primes([32, 5, 11], -5)  == [17, nil, nil]
p pretentious_primes([32, 5, 11], -5)
