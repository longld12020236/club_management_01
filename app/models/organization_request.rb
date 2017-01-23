class OrganizationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :status

  has_many :activities, as: :target

  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :description, presence: true,
    length: {minimum: Settings.min_description}
  validates :location, presence: true,
    length: {minimum: Settings.min_location}
  validates :phone, presence: true

  delegate :full_name, to: :user, allow_nil: :true

  scope :unapprove, ->{where.not(status_id: Settings.approved)}
  scope :newest, -> {order created_at: :desc}
end
