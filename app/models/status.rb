class Status < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :user_organizations, dependent: :destroy
  has_many :club_requests, dependent: :destroy
  has_many :organization_requests, dependent: :destroy

end
