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
end