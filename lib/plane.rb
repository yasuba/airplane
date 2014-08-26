class Plane

	def initialize
		fly!
	end

	def flight
		@flight
	end

	def land!
		@flight = :landed
	end

	def fly!
		@flight = :flying
	end

end