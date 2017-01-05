class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :trackable, :validatable

  validates :full_name, presence: true, length: {maximum: Settings.max_name}
  validates :password, presence: true, length: {minimum: Settings.min_password}
end
