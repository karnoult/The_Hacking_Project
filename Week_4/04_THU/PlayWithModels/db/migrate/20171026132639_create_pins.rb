class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :url_image
      t.references :utilisateur_p, foreign_key: true

      t.timestamps
    end
  end
end
