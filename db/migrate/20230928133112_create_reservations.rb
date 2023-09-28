class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :party_size, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.string :occasion

      t.timestamps
    end
  end
end
