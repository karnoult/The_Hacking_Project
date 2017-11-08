class CreateMoussaillons < ActiveRecord::Migration[5.1]
  def change
    create_table :moussaillons do |t|
      t.string :first_name
      t.integer :age
      t.string :likeness
      t.string :bio
      t.string :slack_handle
      t.string :github_handle

      t.timestamps
    end
  end
end
