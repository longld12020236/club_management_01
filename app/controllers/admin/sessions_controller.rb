class Admin::SessionsController < Devise::SessionsController
  layout "admin_layout"

  def new
    super
  end

  def create
    super
  end

  private
  def after_sign_in_path_for admin
    "/admin/home"
  end

  def after_sign_out_path_for admin
    "/admin"
  end

  def after_sign_in_fail_path_for admin
    "/admin/home"
  end
end
