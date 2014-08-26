require 'plane'

describe Plane do

	let(:plane) {Plane.new}
	let(:airport) {double :airport}

	context 'when it is initialized' do

		it 'should have a flying status' do
			expect(plane.flight).to eq :flying
		end

	end

	context 'preparing for landing' do

		it 'has a flight status of landed after landing' do
			plane.land!
			expect(plane.flight).to eq :landed
		end

	end

	context 'preparing for take-off' do

		xit 'should change flight status to flying after take off' do
			allow(airport).to receive(:departures).with(plane).and_return(:flying)
			plane.fly_from(airport)
			expect(plane.flight).to eq :flying
		end

	end

end