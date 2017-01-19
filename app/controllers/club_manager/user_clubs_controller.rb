class ClubManager::UserClubsController < BaseClubManagerController
  before_action :load_club
  before_action :load_userclub, only: [:edit, :update]

  def index
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to club_manager_path
    end
    @user_clubs = @club.user_clubs.unactive
  end

  def update
    if @user_club.update_attributes status_id: params[:user_club][:status_id]
      flash[:success] = t "club_manager.user_club.success_update"
    else
      flash_error @club
    end
    redirect_to :back
  end

  private
  def load_userclub
    @user_club = UserClub.find_by id: params[:id]
    unless @user_club
      flash[:danger] = t "cant_found_request"
      redirect_to club_manager_path
    end
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "club_manager.club.not_found"
      redirect_to club_manager_club_albums_path params[:club_id]
    end
  end
end
