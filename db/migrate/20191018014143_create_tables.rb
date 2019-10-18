class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :type_table
      t.string :desc

      t.timestamps
    end
  end
end
