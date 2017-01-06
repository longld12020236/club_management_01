class Admin::UsersController < ApplicationController
  before_action :load_user, except: :index
  layout "admin_layout"

  def index
    @users = User.all
  end

  def show

  end


  private

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = "Can not found user"
      redirect_to admin_users_path
    end
  end
end
