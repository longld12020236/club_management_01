class Admin::OrganizationRequestsController < ApplicationController
  layout "admin_layout"
  before_action :admin_signed_in
  before_action :load_organization_request, except: :index
  before_action :load_unapprove

  def index
  end

  def edit
  end

  def update
    service = ApproveOrganizationService.new @organization_request
    id_status = params[:organization_request][:status_id]
    if id_status == Settings.approved.to_s
      ActiveRecord::Base.transaction do
        service.update_service
        flash[:success] = t "approve_success"
        redirect_to admin_organization_requests_path
      end
    else
      service.update_request id_status
      flash[:success] = t "update_success"
      redirect_to admin_organization_requests_path
    end
    rescue
      flash[:danger] = t "cant_approve"
      redirect_to :back
  end

  def destroy
    if @organization_request.destroy
      flash[:success] = t "deleted_successfull"
    else
      flash[:danger] = t "delete_unsuccessfull"
    end
    render :index
  end

  private
  def load_unapprove
    @organization_requests = OrganizationRequest.unapprove
    unless @organization_requests
      flash_error @organization_requests
      redirect_to :back
    end
  end

  def load_organization_request
    @organization_request = OrganizationRequest.find_by id: params[:id]
    unless @organization_request
      flash[:danger] = t "not_found_request"
      redirect_to root_path
    end
  end
end
