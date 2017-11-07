class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :airport_code, limit: 3

      t.timestamps
    end
    add_index :airports, :airport_code, unique: true
  end
end
