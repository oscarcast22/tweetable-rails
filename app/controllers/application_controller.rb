class ApplicationController < ActionController::Base
  before_action :configure_permited_parameter, if: :devise_controller?

  private

  def configure_permited_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
  end
end
