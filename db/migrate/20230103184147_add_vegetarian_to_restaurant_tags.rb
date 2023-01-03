class AddVegetarianToRestaurantTags < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_tags, :vegetarian, :boolean
  end
end
