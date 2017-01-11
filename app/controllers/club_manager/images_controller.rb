class ClubManager::AlbumsController < BaseClubManagerController

  before_action :load_image, except: :create
  before_action :correct_manager

  def create
    image = Image.new image_params
    image.user_id = current_user.id
    if image.save
      flash[:succsess] = t "club_manager.image.succsess_create"
      redirect_to club_manager_club_images_path(params[:club_id])
    else
      flash_error image
      redirect_to club_manager_club_images_path(params[:club_id])
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def image_params
    params.require(:image).permit :name, :url, :user_id, :album_id
  end

  def load_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:danger] = t "not_found_album"
      redirect_to root_url
    end
  end
end
