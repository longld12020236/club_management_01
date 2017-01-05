class Admin::UsersController < ApplicationController
  layout "admin_layout"

  def index
    @users = User.all
    @o = Organization.all
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
  end
end
