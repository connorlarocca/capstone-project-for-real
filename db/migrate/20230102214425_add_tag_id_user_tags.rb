class AddTagIdUserTags < ActiveRecord::Migration[7.0]
  def change
    add_column :user_tags, :tag_id, :integer
  end
end
