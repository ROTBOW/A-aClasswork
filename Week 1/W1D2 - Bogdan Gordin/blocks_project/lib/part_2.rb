

def all_words_capitalized?(arr)
    arr.all? {|word| word.downcase.capitalize == word }
end

def no_valid_url?(arr)
    valid = ['com', 'net', 'io', 'org']
    arr.none? {|url|  valid.include? url.split('.')[1]}
end


def any_passing_students? (arr)
    
end