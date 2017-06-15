class ChangePlanetSchematics < ActiveRecord::Migration[5.1]
  def change
    rename_table :planetSchematics, :schematics
    change_table :schematics do |t|
      t.rename :schematicID, :schematic_id
      t.rename :schematicName, :name
      t.rename :cycleTime, :cycle_time
    end
  end
end
