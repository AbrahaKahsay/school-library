class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize(name = "Unknown", age, parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    private
    def is_of_age?
        if @age >= 18
            true
        elsif
            false
        end
    end
end