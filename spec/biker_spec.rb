require './spec/spec_helper'

RSPec.describe Biker do
    before(:each) do
        @biker = Biker.new("Kenny", 30)
    end

    it 'exists' do
        expect(@biker).to be_an_instance_of(Biker)
    end

    it 'has attributes' do
        expect(@biker.name).to eq("Kenny")
        expect(@biker.max_distance).to eq(30)
    end

    it 'starts with no acceptable terrain' do
        expect(@biker.acceptable_terrain).to eq([])
    end

    it 'starts with no rides' do
        expect(@biker.rides).to eq({})
    end
end