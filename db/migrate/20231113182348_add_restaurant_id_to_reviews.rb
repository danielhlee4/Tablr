class AddRestaurantIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :restaurant_id, :bigint, null: false
    add_index :reviews, :restaurant_id
    add_foreign_key :reviews, :restaurants, column: :restaurant_id
  end
end
