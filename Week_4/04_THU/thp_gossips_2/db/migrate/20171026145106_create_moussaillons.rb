class CreateMoussaillons < ActiveRecord::Migration[5.1]
  def change
    create_table :moussaillons do |t|
      t.text :bio
      t.string :username
      t.string :email

      t.timestamps
    end
    add_index :moussaillons, :username, unique: true
    add_index :moussaillons, :email, unique: true
  end
end
