class ChangeMapSolarSystemJumps < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapSolarSystemJumps, :system_connections
    change_table :system_connections do |t|
      t.rename :fromSolarSystemID, :from_system_id
      t.index :from_system_id
      t.rename :toSolarSystemID, :to_system_id
      t.index :to_system_id
    end
    add_foreign_key :system_connections, :solar_systems, column: :from_system_id,
                                                         primary_key: :system_id
    add_foreign_key :system_connections, :solar_systems, column: :to_system_id,
                                                         primary_key: :system_id
    remove_column :system_connections, :fromRegionID, :integer
    remove_column :system_connections, :fromConstellationID, :integer
    remove_column :system_connections, :toConstellationID, :integer
    remove_column :system_connections, :toRegionID, :integer
  end
end
