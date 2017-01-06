class AdminsController < ApplicationController
  before_action :load_admin
  layout "admin_layout"
  def show

  end

  def update
    if @admin.update_attributes admin_parmas
      flash[:success] = t("success")
      redirect_to admin_home_path
    else
      flash[:danger] = t("fail")
      redirect_to :back
    end
  end

  private
  def load_admin
    @admin = Admin.find_by id: params[:id]
    unless @admin
      flash[:danger] = "Can not found user"
      redirect_to root_path
    end
  end

  def admin_params
    params.require(:admin).permit :full_name, :email, :phone, :password,
      :password_confirmation, :avatar
  end
end
