# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    answer = ''
    count = 0
    target = str[0]
    str << '*'
    str.each_char do |letter|
        if letter == target
            count += 1
            next
        else
            if count == 1
                answer << target
                target = letter
                count = 1
                next
            else
                answer << count.to_s + target
                target = letter
                count = 1
                next
            end
        end
    end
    answer
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
