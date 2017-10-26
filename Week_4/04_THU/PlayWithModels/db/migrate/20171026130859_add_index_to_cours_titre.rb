class AddIndexToCoursTitre < ActiveRecord::Migration[5.1]
  def change
    add_index :cours, :titre, unique: true
  end
end
