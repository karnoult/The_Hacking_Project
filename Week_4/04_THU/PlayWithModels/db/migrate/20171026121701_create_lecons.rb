class CreateLecons < ActiveRecord::Migration[5.1]
  def change
    create_table :lecons do |t|
      t.string :titre
      t.text :contenu
      t.references :cour, foreign_key: true

      t.timestamps
    end
    add_index :lecons, :titre, unique: true
  end
end
