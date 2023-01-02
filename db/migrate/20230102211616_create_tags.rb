class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.boolean :vegan
      t.boolean :vegetarian
      t.boolean :spicy
      t.boolean :gluten_free

      t.timestamps
    end
  end
end
