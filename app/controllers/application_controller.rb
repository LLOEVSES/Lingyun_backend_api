class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  #protect_from_forgery with: :null_session

  #include DeviseTokenAuth::Concerns::ResourceFinder
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    end

end
