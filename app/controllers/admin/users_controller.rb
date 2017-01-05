class Admin::UsersController < ApplicationController
  layout "admin_layout"

  def index
    @users = User.all
    @o = Organization.all
  end

  def edit
    @users = User.find_by id: params[:id]
  end

  def update
    @users.is_admin_company = true
    if @users.update_attributes is_admin_company: true
      flash[:success] = t("admin_company_set")
    else
      flash[:danger] = t("admin_company_fail")
    end
    redirect_to :back
  end
end
