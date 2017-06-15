class ChangePlanetSchematicsPinMap < ActiveRecord::Migration[5.1]
  def change
    rename_table :planetSchematicsPinMap, :pin_schematics
    change_table :pin_schematics do |t|
      t.rename :schematicID, :schematic_id
      t.rename :pinTypeID, :pin_type_id
    end
    add_foreign_key :pin_schematics, :schematics, primary_key: :schematic_id
    add_foreign_key :pin_schematics, :items, column: :pin_type_id,
                                             primary_key: :type_id
  end
end
