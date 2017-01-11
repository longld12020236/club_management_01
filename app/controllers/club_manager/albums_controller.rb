class ClubManager::AlbumsController < BaseClubManagerController

  before_action :load_album, except: [:index, :create]
  before_action :correct_manager

  def index
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to club_manager_path
    end
    @albums = @club.albums.page(params[:page]).per Settings.per_page_album
  end

  def show
    @images = @album.images.page(params[:page]).per Settings.per_page_image
  end

  def create
    album = Album.new album_params
    album.club_id = params[:club_id]
    if album.save
      flash[:succsess] = t "club_manager.album.succsess_create"
      redirect_to club_manager_club_albums_path(params[:club_id])
    else
      flash_error album
      redirect_to club_manager_club_albums_path(params[:club_id])
    end
  end

  def edit

  end

  def update

  end
  private
  def load_album
    @album = Album.find_by id: params[:id]
    unless @album
      flash[:danger] = t "club_manager.album.not_found"
      redirect_to club_manager_club_albums_path params[:club_id]
    end
  end

  def album_params
    params.require(:album).permit :club_id, :name
  end
end
