require './spec/spec_helper'

RSpec.describe Biker do
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

    it 'learns terrains' do
        @biker.learn_terrain!(:gravel)
        expect(@biker.acceptable_terrain).to eq([:gravel])
    end

    it 'starts with no rides' do
        expect(@biker.ride_log).to eq({})
    end

    describe 'ride log' do
        before(:each) do
            @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
            @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

            @biker2 = Biker.new("Athena", 15)
        end

        it 'can log ride' do
            @biker.learn_terrain!(:gravel)
            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 70.1)
    
            expect(@biker.ride_log).to eq({@ride2 => [60.9, 70.1]})
        end
        
        it 'can only ride if learned terrain' do
            @biker.learn_terrain!(:gravel)
            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride2, 60.9)
    
            expect(@biker.ride_log).to eq({@ride2 => [60.9]})
        end

        it 'can only ride if max distance > ride total distance' do
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            @biker2.log_ride(@ride1, 95.0)
            expect(@biker2.ride_log).to eq({})

            @biker2.log_ride(@ride2, 65.0)
            expect(@biker2.ride_log).to eq({@ride2 =>[65.0]})
        end

        describe 'personal record' do 
            it 'returns personal record for a ride' do
                @biker.learn_terrain!(:gravel)
                @biker.log_ride(@ride2, 92.5)
                @biker.log_ride(@ride2, 60.9)

                expect(@biker.personal_record(@ride2)).to eq(60.9)
            end

            it 'returns false if ride not logged' do
                @biker.learn_terrain!(:gravel)
                @biker.log_ride(@ride2, 92.5)
                @biker.log_ride(@ride2, 60.9)

                expect(@biker.personal_record(@ride1)).to be false
            end
        end
    end
end