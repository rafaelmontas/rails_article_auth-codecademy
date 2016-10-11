class SessionsController < ApplicationController
	before_action :require_logged_out, only: [:new]
	def new

	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to "/"
		else
			redirect_to "/login"
		end
	end

	def drestroy
		session[:user_id] = nil
		redirect_to "/"
	end
end
