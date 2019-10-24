class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.date :date_at
      t.references :food, foreign_key: true

      t.timestamps
    end
    add_index :menus, [:date_at, :food_id], unique: true, name: "food_day_of"
  end
end
