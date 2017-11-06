class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.integer :part_number

      t.timestamps
    end
  end
end
