class ChangePlanetSchematicsTypeMap < ActiveRecord::Migration[5.1]
  def change
    rename_table :planetSchematicsTypeMap, :schematic_materials
    change_table :schematic_materials do |t|
      t.rename :schematicID, :schematic_id
      t.rename :typeID, :material_id
      t.rename :isInput, :input
    end
    add_foreign_key :schematic_materials, :schematics, primary_key: :schematic_id
    add_foreign_key :schematic_materials, :items,      column: :material_id,
                                                       primary_key: :type_id
  end
end
