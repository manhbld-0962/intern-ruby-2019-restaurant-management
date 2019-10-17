class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
    	t.string :name, unique: true
    	t.integer :number
    	t.string :desc

      t.timestamps
    end
  end
end
