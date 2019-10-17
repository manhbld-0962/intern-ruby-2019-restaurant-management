class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name, unique: true
      t.integer :discount_value
      t.string :description

      t.timestamps
    end
  end
end
