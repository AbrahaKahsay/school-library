class Person
    def initialize(name, age, parent_permission)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
end