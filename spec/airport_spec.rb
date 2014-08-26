require 'airport'
require 'plane'

describe Airport do

	let(:gatwick)  {Airport.new}
	let(:plane)	   {Plane.new}

	def sunny
		allow(gatwick).to receive(:weather_report).and_return('sunny')
	end

	def windy
		allow(gatwick).to receive(:weather_report).and_return('windy')
	end

	def fill_airport(gatwick)
		(Airport::DEFAULT_CAPACITY).times {gatwick.arrivals(plane)}
	end

	context 'for arrivals and departures' do

		it 'should allow planes to land in good weather' do
			sunny
			gatwick.arrivals(plane)
			expect(gatwick).to have_planes 
		end

		it 'should know a plane is landed after landing' do
			sunny
			expect(plane).to receive(:land!).and_return(:landed)
			gatwick.arrivals(plane)
		end

		it 'should allow planes to take off when it is sunny' do
			sunny
			gatwick.arrivals(plane)
			gatwick.departures(plane)
			expect(gatwick).not_to have_planes
		end

		it 'should know a plane is flying after take off' do
			sunny
			expect(plane).to receive(:fly!).and_return(:flying)
			gatwick.departures(plane)

		end

	end

	context 'traffic control' do

		it 'should know how many planes it has' do
			sunny
			gatwick.arrivals(plane)
			expect(gatwick.planes_count).to eq(1)
		end

		it 'should know when it is full' do
			sunny
			fill_airport(gatwick)
			expect(gatwick).to be_full
		end

		it 'should not allow planes to land when it is full' do
			sunny
			fill_airport(gatwick)
			expect(lambda { gatwick.arrivals(plane) }).to raise_error
		end

	end

	context 'regarding the weather' do

		it 'should not allow planes to take off in bad weather' do
			windy
			expect(lambda{gatwick.departures(plane)}).to raise_error
		end

		it 'should not allow planes to land in bad weather' do
			windy
			expect(lambda{gatwick.arrivals(plane)}).to raise_error
		end

	end
end