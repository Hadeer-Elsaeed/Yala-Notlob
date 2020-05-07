class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:index]
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :image) }
    end
    before_action :authenticate_user!, :user_notification

    private
    def user_notification
        if current_user
            @my_notifications = OrderFriend.where(user_id: current_user.id).order(id: :desc)
            # @numbers_of_unseen_notifications = @my_notifications.where(seen: 0).count
        end
    end
end
