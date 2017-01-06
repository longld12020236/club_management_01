class Admin::OrganizationsController < ApplicationController
  layout "admin_layout"

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:success] = t "create_company_success"
      redirect_to admin_organizations_path
    else
      flash[:danger] = t("create_company_fail")
      render :new
    end
  end

  private
  def organization_params
    params.require(:organization).permit :name, :email, :phone,
      :location, :description
  end
end
