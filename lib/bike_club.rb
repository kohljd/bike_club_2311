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

    def best_time(ride)
        # p ride_list = @bikers.flat_map {|biker| biker.ride_log.keys}.uniq
        ride_bikers = @bikers.select {|biker| biker.ride_log.keys.include?(ride)}
        ride_personal_records = ride_bikers.to_h {|biker| [biker, biker.personal_record(ride)]}
        ride_personal_records.min_by {|biker, record| record}.first
    end

    def eligible_bikers(ride)
        @bikers.select {|biker| biker.eligible?(ride)}
    end

    def record_group_ride(ride)
        group_ride = Hash.new
        group_ride[:members] = eligible_bikers(ride)
        group_ride[:ride] = ride
        group_ride[:start_time] = Time.now
        group_ride
    end
end