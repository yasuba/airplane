require 'plane'
require 'airport'
require 'met_office'

# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The Grand Finale" do

	before(:each) do
		allow(gatwick).to receive(:weather_report).and_return('sunny')
	end

	let(:gatwick)	   {Airport.new}
	
	planes = [
	british_airways   = Plane.new,
	air_france        = Plane.new,
	lufthansa         = Plane.new,
	quantas           = Plane.new,
	cathay_pacific    = Plane.new,
	american_airlines = Plane.new ]

  	it 'all planes can land and all planes can take off' do
  		gatwick.capacity = 6
  		planes.each {|plane| gatwick.arrivals(plane); expect(plane.flight).to eq :landed}
		expect(gatwick).to be_full
		planes.each {|plane| gatwick.departures(plane); expect(plane.flight).to eq :flying}
	end

end
