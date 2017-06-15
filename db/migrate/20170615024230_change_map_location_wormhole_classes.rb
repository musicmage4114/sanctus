class ChangeMapLocationWormholeClasses < ActiveRecord::Migration[5.1]
  class WormholeSystemClass < ActiveRecord::Base
  end
  
  def change
    rename_table :mapLocationWormholeClasses, :wormhole_system_classes
    change_table :wormhole_system_classes do |t|
      t.rename :locationID, :location_id
      t.rename :wormholeClassID, :class_id
    end
  end

  def data
    add_column :wormhole_system_classes, :location_type, :string

    WormholeSystemClass.reset_column_information
    WormholeSystemClass.where("location_id > ? and location_id < ?", 10000000, 20000000).update_all(location_type: 'Region')
    WormholeSystemClass.where(location_id: [20000061, 20000062]).update_all(location_type: 'Constellation')
    WormholeSystemClass.where("location_id > ? and location_id < ?", 30000000, 40000000).update_all(location_type: 'SolarSystem')
  
    add_index :wormhole_system_classes, [:location_type, :location_id], name: 'wormhole_system_class_location_type_and_id'
  end

  def rollback
    remove_index :mapLocationWormholeClasses, name: 'wormhole_system_class_location_type_and_id'
    remove_column :mapLocationWormholeClasses, :location_type
  end
end
