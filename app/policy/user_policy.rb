class UserPolicy < Struct.new(:current_user, :id)

	def is_admin?
		raise Exceptions::UnAuthorizedError unless current_user.admin?
	end

	def authorized?
		raise Exceptions::UnAuthorizedError unless (current_user.admin? || current_user.id == id)
	end
end
