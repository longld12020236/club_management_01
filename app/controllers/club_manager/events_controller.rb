class ClubManager::EventsController < BaseClubManagerController

  def index
  end

  def create
    event = Event.new event_params
    if event.save
      create_acivity event, current_user, Settings.create
      flash[:succsess] = t "club_manager.event.succsess_create"
      redirect_to club_manager_club_events_path params[:club_id]
    else
      flash_error event
      redirect_to :back
    end
  end

  private
  def event_params
    params.require(:event).permit :club_id, :name, :date_start,
      :expense, :date_end, :location, :description, :image
  end
end
