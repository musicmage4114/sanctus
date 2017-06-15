class DropRegionIdsFromConstellationConnections < ActiveRecord::Migration[5.1]
  def up
    remove_index :constellation_connections, :from_region_id
    remove_index :constellation_connections, :to_region_id
    remove_index :constellation_connections, name: 'from_constellation_to_region_index'
    remove_index :constellation_connections, name: 'from_region_to_constellation_index'
    remove_column :constellation_connections, :from_region_id
    remove_column :constellation_connections, :to_region_id
  end
  
  def down
    add_column :constellation_connections, :from_region_id, :integer
    add_column :constellation_connections, :to_region_id, :integer
    add_index :constellation_connections, name: 'from_constellation_to_region_index'
    add_index :constellation_connections, name: 'from_region_to_constellation_index'
    add_index :constellation_connections, :from_region_id
    add_index :constellation_connections, :to_region_id
  end
end
