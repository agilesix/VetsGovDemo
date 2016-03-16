class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
    add_index :places, :city
    add_index :places, :state
    add_index :places, :zip
  end
end
