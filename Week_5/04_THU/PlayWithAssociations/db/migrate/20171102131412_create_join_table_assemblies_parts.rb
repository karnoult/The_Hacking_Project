class CreateJoinTableAssembliesParts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :assemblies, :parts do |t|
      t.index [:assembly_id, :part_id]
      t.index [:part_id, :assembly_id]
    end
  end
end
