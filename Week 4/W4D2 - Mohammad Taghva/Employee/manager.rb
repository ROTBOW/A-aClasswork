require_relative "./employee"
require 'byebug'

class Manager < Employee

    attr_accessor :assigned_employees

    def initialize(name, title, salary, boss=nil)
        super(name, title, salary, boss)
        @assigned_employees = []
    end

    def bonus(multiplier)
        temp = 0
        queue = []
        queue.concat(assigned_employees)
        until queue.empty?
            employee = queue.shift
            if employee.assigned_employees.empty?
                temp += employee.salary
            else
                queue.concat(employee.assigned_employees)
                temp += employee.salary
            end
        end
        temp * multiplier
    end

end

ned = Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

ned.assigned_employees << darren
darren.assigned_employees.push(shawna, david)


p "Ned's bonus is #{ned.bonus(5)}"       # should be: 500_000
p "Darren's bonus is #{darren.bonus(4)}"# should be: 88_000
p "David's bonus is #{david.bonus(3)}" # should be: 30_000