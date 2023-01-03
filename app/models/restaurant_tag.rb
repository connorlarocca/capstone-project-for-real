class RestaurantTag < ApplicationRecord
  has_many :restaurants, through: :restaurant_tags
  has_many :restaurant_tags
end
