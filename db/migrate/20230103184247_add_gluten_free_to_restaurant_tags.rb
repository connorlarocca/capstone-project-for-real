class AddGlutenFreeToRestaurantTags < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_tags, :gluten_free, :boolean
  end
end
