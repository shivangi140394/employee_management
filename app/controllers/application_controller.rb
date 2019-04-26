class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end
  
  protected
    def configure_permitted_parameters
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
      update_attrs = [:password, :current_password, :password_confirmation]
      devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end
end
