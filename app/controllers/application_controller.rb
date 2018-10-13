class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	include Exceptions
	rescue_from Exceptions::UnAuthorizedError, with: :user_not_authorized

	def user_not_authorized

		redirect_to home_path, alert:  t(:unauthorized)
	end
end
