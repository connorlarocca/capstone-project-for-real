class AddSpicyToRestaurantTags < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_tags, :spicy, :boolean
  end
end
