class ApplicationController < ActionController::Base
    # before_action :authenticate_user!  for session but not work when i sign with facebook or google
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
