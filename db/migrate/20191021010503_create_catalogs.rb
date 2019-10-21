class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :name, unique: true
      t.string :description, default: ""

      t.timestamps
    end
  end
end
