class ChangeTagIdUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_tags, :tag_id, :integer
  end
end
