class ChangeMapJumps < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapJumps, :stargates
    change_table :stargates do |t|
      t.rename :stargateID, :stargate_id
      t.rename :destinationID, :destination_stargate_id
      t.index :destination_stargate_id
      t.belongs_to :destination_system, index: true
      t.belongs_to :solar_system, index: true
      t.belongs_to :stargate_type, index: true
      t.string :name
      t.float :x
      t.float :y
      t.float :z
      t.index [:stargate_id, :destination_stargate_id]
      t.index [:stargate_id, :destination_system_id]
    end
    add_foreign_key :stargates, :solar_systems, primary_key: :system_id
    add_foreign_key :stargates, :solar_systems, column: :destination_system_id,
                                                primary_key: :system_id
    add_foreign_key :stargates, :stargates,     column: :destination_stargate_id,
                                                primary_key: :stargate_id
    add_foreign_key :stargates, :items,         column: :stargate_type_id,
                                                primary_key: :type_id
  end
end
