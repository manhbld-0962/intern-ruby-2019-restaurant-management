module ApplicationHelper
  include Pagy::Frontend

  def check_admin_login?
    current_user&.admin?
  end
end
