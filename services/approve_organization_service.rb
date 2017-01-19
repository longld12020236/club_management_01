class ApproveOrganizationService
  def initialize organization_request
    @organization_request= organization_request
    @user = @organization_request.user
  end

  def approve_request
    @organization_request.update_attributes status_id: Settings.approved
  end

  def create_organization organization
    @organization = Organization.new(organization.slice(:name,
      :description, :phone, :email, :location, :logo))
    @organization if @organization.save
  end

  def create_user_organization organization_id
    @user_organization = UserOrganization.new user_id: @user.id,
      organization_id: organization_id, is_admin: true
    @user_organization.save
  end

  def update_request value
    @organization_request.update_attributes status_id: value
  end

  def update_service
    approve_request
    @organization = create_organization @organization_request
    create_user_organization @organization.id
  end
end
