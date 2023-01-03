class Tag < ApplicationRecord
  has_many :users, through: :user_tags
  has_many :restaurants, through: :restaurant_tags
  has_many :user_tags
  has_many :restaurant_tags
  belongs_to :user
end
