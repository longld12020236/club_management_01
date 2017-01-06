class Manager::ClubRequestsController < ApplicationController
  layout "manager_layout"

  def index
    @club_requests = ClubRequest.all
  end

  def edit

  end

  def update

  end
end
