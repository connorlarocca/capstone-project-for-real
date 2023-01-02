class RemoveTagIdFromRestaurantTags < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurant_tags, :tag_id, :integer
  end
end
