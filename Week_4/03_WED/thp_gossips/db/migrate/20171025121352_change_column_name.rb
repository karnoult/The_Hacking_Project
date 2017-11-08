class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :gossips, :autor, :author
  end
end
