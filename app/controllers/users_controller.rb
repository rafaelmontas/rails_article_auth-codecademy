class UsersController < ApplicationController
	before_action :require_logged_out, only: [:new]
	before_action :require_user, only: [:show, :edit]

	def show
		@user = User.find(session[:user_id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/"
		else
			redirect_to "/signup"
		end
	end

	def update
		@user = User.find(session[:user_id])
		if @user.update(user_params)
			redirect_to @user
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
