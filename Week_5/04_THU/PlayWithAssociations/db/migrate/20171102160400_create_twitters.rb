class CreateTwitters < ActiveRecord::Migration[5.1]
  def change
    create_table :twitters do |t|
      t.string :name

      t.timestamps
    end
  end
end
