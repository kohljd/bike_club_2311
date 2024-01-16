require './spec/spec_helper'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end

    it 'exists' do
        expect(@ride1).to be_an_instance_of(Ride)
    end

    it 'has attributes' do
        expect(@ride1.name).to eq("Walnut Creek Trail")
        expect(@ride1.distance).to eq(10.7)
        expect(@ride1.terrain).to eq(:hills)
    end

    it 'states if ride loops' do
        expect(@ride1.loop?).to be false

        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        expect(ride2.loop?).to be true
    end

    it 'doubles total distance if no loop' do
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        expect(ride2.total_distance).to eq(14.9)

        expect(@ride1.total_distance).to eq(21.4)
    end
end