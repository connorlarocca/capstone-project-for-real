class RemovePasswordFromRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :password
  end
end
