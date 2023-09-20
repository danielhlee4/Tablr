class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :cuisine, null: false
      t.string :expense, null: false
      t.string :price_range, null: false
      t.string :neighborhood, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :website_url
      t.timestamps
    end
    add_index :restaurants, :name
    add_index :restaurants, :cuisine
    add_index :restaurants, :expense
    add_index :restaurants, :neighborhood
  end
end
