class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :desc
      t.datetime :date
      t.string :place
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
