class Plane

	attr_reader :flight

	def initialize
		fly!
	end

	def land!
		@flight = :landed
	end

	def fly!
		@flight = :flying
	end

end