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
end