def hipsterfy(str)
    vowels = ['a', 'e', 'i','o', 'u']

    str.reverse!
    str.each_char.with_index do |letter, index|

        if vowels.include?(letter) 
            str[index] = ""
            break
        end

    end

    str.reverse!
end

def vowel_counts (string)
    vowels = ['a', 'e', 'i','o', 'u', 'A', 'E','U','I','O']
    hash = Hash.new(0)
        
    string.each_char do |letter|
        letter.downcase!

        if vowels.include? letter
            hash[letter] += 1
        end

    end
    hash
end

def caesar_cipher(string, num)
    alphabet = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    string.each_char.with_index do |letter, index|
        finder = alphabet.index(letter)
        finder = num + (finder % alphabet.length)
        string[index] = alphabet[finder]

    end
    string
end

# p caesar_cipher('ax', 3)