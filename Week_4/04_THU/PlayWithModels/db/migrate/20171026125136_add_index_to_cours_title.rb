class AddIndexToCoursTitle < ActiveRecord::Migration[5.1]
  def change
    add_index :lecons, :titre, unique: true
  end
end
