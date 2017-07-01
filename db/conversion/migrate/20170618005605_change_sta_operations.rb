class ChangeStaOperations < ActiveRecord::Migration[5.1]
  def change
    rename_table :staOperations, :structure_operations
    change_table :structure_operations do |t|
      t.rename :operationID, :operation_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :operationName, :name
      t.rename :caldariStationTypeID, :caldari_station_type_id
      t.index :caldari_station_type_id, name: 'caldari_station_index'
      t.rename :minmatarStationTypeID, :minmatar_station_type_id
      t.index :minmatar_station_type_id, name: 'minmatar_station_index'
      t.rename :amarrStationTypeID, :amarr_station_type_id
      t.index :amarr_station_type_id, name: 'amarr_station_index'
      t.rename :gallenteStationTypeID, :gallente_station_type_id
      t.index :gallente_station_type_id, name: 'gallente_station_index'
      t.rename :joveStationTypeID, :jove_station_type_id
      t.index :jove_station_type_id, name: 'jove_station_index'
    end
    add_foreign_key :dockable_structures, :structure_operations, column: :operation_id,
                                                                 primary_key: :operation_id
    add_foreign_key :structure_operations, :items, column: :caldari_station_type_id,
                                                   primary_key: :type_id
    add_foreign_key :structure_operations, :items, column: :minmatar_station_type_id,
                                                   primary_key: :type_id
    add_foreign_key :structure_operations, :items, column: :amarr_station_type_id,
                                                   primary_key: :type_id
    add_foreign_key :structure_operations, :items, column: :gallente_station_type_id,
                                                   primary_key: :type_id
    add_foreign_key :structure_operations, :items, column: :jove_station_type_id,
                                                   primary_key: :type_id
  end
end
