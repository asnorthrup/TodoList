class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	before_action :ensure_login
  	helper_method :logged_in?, :current_user

  	#children can inherit
  	protected
  	def ensure_login
  		#always go to login page unless sessions contains
  		#user_id, session :user_id is populated in login
		redirect_to login_path unless session[:user_id]
	end

	def logged_in?
		session[:user_id] #nil is false
	end
	def current_user
		#get user based on user_id
		#the instance variable is cached during each request
		@current_user ||= User.find(session[:user_id])
	end

end
