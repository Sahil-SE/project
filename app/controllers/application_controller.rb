class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
	
	def after_sign_in_path_for(user)
		if user.roles.find_by(name: "student")
			user_dashboard_path
		elsif user.roles.find_by(name: "assesor")
			assessor_dashboard_path
		elsif user.roles.find_by(name: "creator")
			creator_dasboard_path	
		else
			test_dashboard_path
		end
	end

	rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
	end
end