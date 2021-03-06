class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

  # Include Application helper.
	include ApplicationHelper
 
	
	#add_flash_types :success, :danger, :info
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :full_name, :login])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role, :full_name, :login, :avatar])
	end

  def after_sign_in_path_for(resource)
		dashboard_path
	
	end
end
