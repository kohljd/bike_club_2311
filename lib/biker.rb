class Biker
    attr_reader :name,
                :max_distance,
                :ride_log,
                :acceptable_terrain

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @ride_log = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if @max_distance >= ride.total_distance && @acceptable_terrain.include?(ride.terrain)
            @ride_log[ride] ||= []
            @ride_log[ride] << time
        end
    end

    def personal_record(ride)
        return false unless @ride_log.keys.include?(ride)
        @ride_log[ride].min
    end
end