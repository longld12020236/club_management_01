class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events
  has_many :comments, as: :target, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy

  belongs_to :club
  belongs_to :event_category

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {minimum: Settings.min_name}
  validates :expense, presence: true
  validates :location, presence: true, length: {minimum: Settings.min_location}
  validates :description, presence: true, length: {minimum: Settings.min_description}
  validates :date_start, :date_end, presence: true

  scope :top_like, -> {order num_like: :desc}
  scope :newest, -> {order created_at: :desc}
  scope :by_current_year, -> {where "year(created_at) = ?", Time.zone.now.year}
  scope :by_quarter, -> months {where("month(created_at) in (?)", months)}

  enum is_finished: {in_process: 0 , finished: 1}

  def self.group_by_quarter
    quarters = [[1,2,3], [4,5,6], [7,8,9], [10,11,12]]
    array = Array.new
    quarters.each_with_index do |quarter, index|
      list_events = self.by_quarter quarters[index]
      array.push list_events
    end
    array
  end
end
