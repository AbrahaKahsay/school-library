class Teacher < Person
    def initialize(specialization)
        super(name = "Unknown", age)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end