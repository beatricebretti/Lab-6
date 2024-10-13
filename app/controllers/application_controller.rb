class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  def configure_permitted_parameters
    # Permit first_name and last_name during sign up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end
end
