class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :number
      t.references :food, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
    add_index :orders, [:booking_id, :food_id], unique: true, name: "food_of_book"
  end
end
