class ChangeStaStationTypes < ActiveRecord::Migration[5.1]
  def change
    rename_table :staStationTypes, :station_details
    change_table :station_details do |t|
      t.rename :stationTypeID, :station_type_id
      t.rename :dockEntryX, :dock_entry_x
      t.rename :dockEntryY, :dock_entry_y
      t.rename :dockEntryZ, :dock_entry_z
      t.rename :dockOrientationX, :dock_orientation_x
      t.rename :dockOrientationY, :dock_orientation_y
      t.rename :dockOrientationZ, :dock_orientation_z
      t.rename :operationID, :operation_id
      t.index :operation_id
      t.rename :officeSlots, :office_slots
      t.rename :reprocessingEfficiency, :reprocessing_efficiency
    end
    add_foreign_key :station_details, :structure_operations, column: :operation_id,
                                                             primary_key: :operation_id
    add_foreign_key :station_details, :items, column: :station_type_id,
                                              primary_key: :type_id
    
    add_index :operation_services, :operation_id
    add_index :operation_services, :service_id
  end
end
