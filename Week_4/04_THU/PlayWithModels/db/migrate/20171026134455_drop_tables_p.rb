class DropTablesP < ActiveRecord::Migration[5.1]
  def change
    drop_table :commentaire_ps
    drop_table :utilisateur_ps
  end
end
