module BookingsHelper
	def check_hour? hour
		hour < 23 && hour > 7
	end
end
