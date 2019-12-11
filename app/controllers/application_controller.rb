class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  private

  def check_admin
    return if current_user.admin?
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :phone, :password, :password_confirmation, :remember_me]
    signup_attrs = [:email] | added_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
