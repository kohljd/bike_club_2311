class BikeClub
    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
    end

    def most_rides
        bikers_ride_counts = @bikers.to_h {|biker| [biker, biker.ride_log.values.flatten.size]}
        bikers_ride_counts.max_by {|biker, ride_count| ride_count}.first
    end
end