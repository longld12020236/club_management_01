class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :status

  has_many :activities, as: :target, dependent: :destroy

  scope :order_date_desc, -> {order created_at: :desc}

  mount_uploader :logo, ImageUploader
end
