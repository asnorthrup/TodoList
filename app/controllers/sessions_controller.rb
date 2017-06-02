class SessionsController < ApplicationController
	#skip action on new, otherwise couldn't go to login page and create because
	#create verifies the parameters so wouldn't populate reviewer id
	skip_before_action :ensure_login, only: [:new, :create]
	def new
		#route to continue straight to sessions/new.html.er
	end

	def create
	  	#get the user's username and password from submitted form
		user = User.find_by(username: params[:user][:username])
		password = params[:user][:password]

		#if there is no username then user is false 
		if user && user.authenticate(password)
	  		#store a reviewer id
	  		session[:user_id] = user.id
	  		redirect_to root_path, notice: "Logged in successfully"
	  	else
	  		redirect_to login_path, alert: "Invalid username/password"
	  	end
	end

	def destroy
		reset_session #rails helper to wipe out session
	  	redirect_to login_path, notice: "You have been logged out"
	end
end
