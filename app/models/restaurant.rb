class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
