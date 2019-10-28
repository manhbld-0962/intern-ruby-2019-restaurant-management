class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  include BookingsHelper

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :name, :phone, :password, :password_confirmation, :remember_me, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
