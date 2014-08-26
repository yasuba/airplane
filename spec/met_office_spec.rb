require 'met_office'

describe 'MetOffice' do

	let(:heathrow) {Airport.new}

	it 'should randomly generate the weather' do
		expect(heathrow.weather_report).to eq('sunny').or eq('windy')
	end	

end