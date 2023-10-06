class Student
    attr_accessor :name
    include Comparable

    def <=>(other)
        @fives <=> other.fives
    end

    def initialize(name, fives, tens, twenties)
        @name = name
        @fives = 5 * fives
        @tens = 10 * tens
        @twenties = 20 * twenties
    end

    def wealth
        @fives + @tens + @twenties
    end
end
