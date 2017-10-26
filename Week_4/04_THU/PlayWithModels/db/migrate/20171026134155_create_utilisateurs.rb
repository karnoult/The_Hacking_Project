class CreateUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :utilisateurs do |t|
      t.string :nom

      t.timestamps
    end
    add_index :utilisateurs, :nom, unique: true
  end
end
