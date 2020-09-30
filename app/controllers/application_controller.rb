class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :about, :username, :slug])
        # devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :about, address_attributes: [:country, :state]])
    end

    def after_sign_in_path_for(resource)
        dashboard_path
    end
end
