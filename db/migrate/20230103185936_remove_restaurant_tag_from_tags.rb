class RemoveRestaurantTagFromTags < ActiveRecord::Migration[7.0]
  def change
    remove_column :tags, :restaurant_id
  end
end
