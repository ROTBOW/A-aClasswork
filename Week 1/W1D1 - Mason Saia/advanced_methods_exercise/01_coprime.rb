# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def factors(num)
    answer = []
    (1...num).each {|i| answer << i if num % i == 0 }
    answer
end

def coprime?(num1, num2)
    number = factors(num1) + factors(num2)

    hash = Hash.new(0)
    
    number.each {|ele| hash[ele] += 1 }
    
    hash.each do |k, v|
        next if k == 1
        return false if v > 1
    end

    true
end

# p factors(25)

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
