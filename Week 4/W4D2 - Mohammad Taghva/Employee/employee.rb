class Employee
    
    attr_reader :name, :title, :salary, :boss, :assigned_employees

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @assigned_employees = []
    end

    def bonus(multiplier)
        salary * multiplier
    end


end