class BikeClub
    attr_reader :name

    def initialize(name)
        @name = name
        @bikers = []
    end
end