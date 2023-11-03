class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :reservation, null: false, foreign_key: true
      t.integer :overall_rating, null: false
      t.integer :food_rating, null: false
      t.integer :service_rating, null: false
      t.integer :ambiance_rating, null: false
      t.integer :value_rating, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
