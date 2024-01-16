require './spec/spec_helper'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end

    it 'exists' do
        expect(@ride1).to be_an_instance_of(Ride)
    end

    it 'has attributes' do
        expect(@ride1.name).to eq()
        expect(@ride1.distance).to eq(10.7)
        expect(@ride1.terrain).to eq(:hills)
        expect(@ride1.loop?).to be false
    end
end