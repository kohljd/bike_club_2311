require './spec/spec_helper'

RSpec.describe BikeClub do
    before(:each) do
        @bike_club = BikeClub.new("Bike Now")
    end

    it 'exists' do
        expect(@bike_club).to be_an_instance_of(BikeClub)
    end

    it 'has a name' do
        expect(@bike_club.name).to eq("Bike Now")
    end

    it 'starts with no bikers' do
        expect(@bike_club.bikers).to eq([])
    end

    it 'can add bikers' do
        biker = Biker.new("Kenny", 30)
        @bike_club.add_biker(biker)

        expect(@bike_club.bikers).to eq([biker])
    end

    describe 'bikers list' do
        before(:each) do
            @biker = Biker.new("Kenny", 30)
            @biker2 = Biker.new("Athena", 15)
            @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 80.2)
            @biker.log_ride(@ride2, 60.9)
            @biker2.log_ride(@ride2, 95.0)
            @biker2.log_ride(@ride2, 65.0)

            @bike_club.add_biker(@biker)
            @bike_club.add_biker(@biker2)
        end

        it 'states rider with most rides' do
            expect(@bike_club.most_rides).to eq(@biker)
        end

        it 'returns biker with best ride time' do
            expect(@bike_club.best_time(@ride2)).to eq(@biker)
        end

        it 'lists ride\'s eligible bikers' do
            expect(@bike_club.eligible_bikers(@ride1)).to eq([@biker])
            expect(@bike_club.eligible_bikers(@ride2)).to eq([@biker, @biker2])
        end
    end
end