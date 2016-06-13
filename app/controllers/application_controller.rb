class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user 

	def current_user

	@current_user = nil
	if (session[:user_id])
		# récupère le record user en fonction du user_id de session
		@current_user = User.find(session[:user_id]) 
	end
	end

	def require_user
		redirect_to '/login' unless current_user
	end

	def require_admin
		redirect_to '/' unless current_user.admin?
	end
	def require_editor
		redirect_to '/' unless current_user.editor?
	end
  
	def reset_session
		@_request.reset_session
	end


end
