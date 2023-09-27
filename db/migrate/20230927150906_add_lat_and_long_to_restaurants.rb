class AddLatAndLongToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :lat, :float, null: false, default: 0.0
    add_column :restaurants, :long, :float, null: false, default: 0.0
  end
end
