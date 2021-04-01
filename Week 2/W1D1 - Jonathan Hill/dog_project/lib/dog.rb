class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        @bark
    end

    def favorite_foods
        @favorite_foods
    end

    def age=(years)
        @age = years
    end

    def bark
        if @age > 3
            return @bark.upcase
        else
            return @bark.downcase
        end
    end

    def favorite_food?(str)
        @favorite_foods.any? {|food| food.downcase == str.downcase }
    end


end
