class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club
  belongs_to :status

  scope :manager, ->{where is_manager: true}
  scope :unactive, ->{where.not(status_id: Settings.approved)}
  scope :user_club, ->club_id do
    where club_id: club_id
  end

  delegate :name, to: :club, allow_nil: :true
  delegate :full_name, :avatar, :email, :phone, to: :user, allow_nil: :true
end
