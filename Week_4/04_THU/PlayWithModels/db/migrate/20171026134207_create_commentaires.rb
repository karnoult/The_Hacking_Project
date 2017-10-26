class CreateCommentaires < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaires do |t|
      t.text :contenu
      t.references :pin, foreign_key: true
      t.references :utilisateur, foreign_key: true

      t.timestamps
    end
  end
end
