class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name, unique: true, null: false
      t.string :desc, null: false
      t.integer :status, null: false
      t.float :price, limit: 53, null: false
      t.float :cost, limit: 53, null: false

      t.timestamps
    end
  end
end
