# top level documentation
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ role_ids: [] }, :first_name, :last_name, :email, :password, :password_confirmation)
    end
  end

  
end