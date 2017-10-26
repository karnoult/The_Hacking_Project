class ChangePinsUtilisateurName < ActiveRecord::Migration[5.1]
  def change
    change_table :pins do |t|
      t.rename :utilisateur_p_id, :utilisateur_id
    end
  end
end
