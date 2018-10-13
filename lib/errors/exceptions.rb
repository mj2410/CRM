module Exceptions
	class MyAppError < StandardError

	end

	class UnAuthorizedError < MyAppError
		def initialize
			super("UnAuthorizedError")
		end
	end 
end