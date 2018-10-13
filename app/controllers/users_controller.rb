 	class UsersController < ApplicationController
	before_action :check_administration, only: [:index, :show, :new, :create, :search, :results, :active_user]

	before_action :check_authorization, only: [:edit, :update, :destroy]

	def index
		@user = User.new
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to users_path
		else
			render 'edit'
		end
	end

	private def user_params
		params.require(:user).permit(:email,:password, :password_confirmation)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to users_path
		else
			@users = User.all
			render 'index'	
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def search
	end

	def results
		@users = User.where("email LIKE ?", "%#{params[:user][:email]}%").load
	end

	def active_user
		@user = User.find(params[:id])
		@user.update_attributes(user_type: 2)
		redirect_to users_path
	end

	def de_active_user
		@user = User.find(params[:id])
		@user.update_attributes(user_type: 3)
		redirect_to users_path
	end

	def check_administration
		UserPolicy.new(current_user, nil).is_admin?
	end

	def check_authorization
		UserPolicy.new(current_user, :id).authorized?
	end
end
