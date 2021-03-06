class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def authenticate_admin!
      if current_user.is_admin? == false
        flash[:error] = "you gotta be in on this exlusive party, bud"
        redirect_to "/"
      end
    end

protected

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
end

end
