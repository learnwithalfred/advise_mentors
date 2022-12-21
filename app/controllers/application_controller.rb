class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You are not authorized to purform this task"
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name bio photo])
  end
end
