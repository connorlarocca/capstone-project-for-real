class Tag < ApplicationRecord
  has_many :users, through: :user_tags
  has_many :restaurants, through: :restaurant_tags
end
