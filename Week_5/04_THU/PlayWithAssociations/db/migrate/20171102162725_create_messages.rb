class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :string
      t.references :sender, foreign_key: {to_table: :twitters}

      t.timestamps
    end
  end
end
