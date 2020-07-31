

class Employee

    attr_reader :name, :salary, title
    attr_accessor :boss

    def initialize(name, salary, title, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(employee)
        self.boss = employee
    end


    def bonus(multiplier)
        self.salary * multiplier
    end

end


class Manager < Employee

    attr_reader :employees

    def initialize(name, salary, title, boss = nil)
        super(name, salary, title, boss = nil)
        employees = []
    end

    def bonus(multiplier)
        self.total_bonus ;* multiplier
    end

    def add_subordinate(subordinate)
        employees << subordinate
    end
    
    protected

    def total_bonus
        total = 0
        self.employees.each do |employee|
            if employee.is_a(Manager)
                total += employee.salary + employee.total_bonus
            else
                total += employee.salary
            end
        end
    end

end