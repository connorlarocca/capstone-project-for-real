class AddTagsToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_tags, :tag_id, :string
  end
end
