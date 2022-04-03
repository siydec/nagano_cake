class ApplicationController < ActionController::Base


 before_action :configure_permitted_parameters, if: :devise_controller?


 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
     new_admin_session_path
    else
     public_root_path
    end
  end

end
