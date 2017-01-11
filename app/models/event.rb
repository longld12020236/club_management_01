class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :comments, as: :target, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy

  belongs_to :club

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {minimum: Settings.min_name}
  validates :expense, presence: true
  validates :location, presence: true, length: {minimum: Settings.min_location}
  validates :description, presence: true, length: {minimum: Settings.min_description}
  validates :date_start, :date_end, :image, presence: true

  scope :top_like, -> {order num_like: :desc}
  scope :newest, -> {order created_at: :desc}
end
