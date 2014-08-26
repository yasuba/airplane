require './lib/met_office'
class Airport
	include MetOffice

	DEFAULT_CAPACITY = 20

	def initialize
		@planes = []
	end

	def has_planes?
		@planes.any?
	end

	def planes_count
		@planes.count
	end

	def arrivals(plane)
		raise "All our runways are in use." if full?
		raise "All flights have been rerouted due to adverse weather conditions." if weather_report == 'windy'
		@planes << plane
		plane.land!	
	end

	def departures(plane)
		raise "All flights cancelled due to adverse weather conditions." if weather_report == 'windy'
		@planes.delete(plane)
		plane.fly! 
	end

	def full?
		planes_count == capacity

	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end
	
	def capacity=(value)
		@capacity = value
	end



end