class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 
  # check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end
 
  protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :lead, :personal_email, :personal_password, :role_id, :designation_id])
      # update_attrs = [:name,:phone, :password, :current_password, :password_confirmation]
      # devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end

    private
 
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
end
