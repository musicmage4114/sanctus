class AddIndexToConstellationConnections < ActiveRecord::Migration[5.1]
  def change
    add_index :constellation_connections, [:to_constellation_id, :from_constellation_id], name: 'to_from_constellation_id_index'
  end
end
