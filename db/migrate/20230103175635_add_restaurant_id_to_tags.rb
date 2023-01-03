class AddRestaurantIdToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :restaurant_id, :integer
  end
end
