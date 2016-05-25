class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 	private

 	def user_not_authorized
   		redirect_to new_users_session_path, :alert => "Access denied."
 	end
  protect_from_forgery with: :exception
end
