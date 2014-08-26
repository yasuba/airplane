module MetOffice

	def weather_report
		@weather = ['sunny', 'windy'].sample
		@weather
		# weather = rand(10)
		# weather > 5 ? @weather = :windy : @weather = :sunny
	end

end

