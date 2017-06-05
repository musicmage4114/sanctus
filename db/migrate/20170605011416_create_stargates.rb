class CreateStargates < ActiveRecord::Migration[5.1]
  def change
    create_table :stargates, id: false do |t|
      t.integer    :stargate_id,          null: false, index: { unique: true }
      t.belongs_to :solar_system,         null: false, index: true
      t.belongs_to :destination,          null: false, index: true
      t.belongs_to :destination_stargate, null: false, index: true
      t.string     :name
      
      # item attributes
      t.integer    :data_export, null: false, default: 1, index: true
      t.belongs_to :group,       null: false, index: true
      t.integer    :type_id
      t.integer    :graphic_id
      t.string     :type # obtained via type_id - "name" attribute
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :stargates, :solar_systems, primary_key: :system_id
    add_foreign_key :stargates, :solar_systems, column: :destination_id,
                                                primary_key: :system_id
    add_foreign_key :stargates, :stargates,     column: :destination_stargate_id,
                                                primary_key: :stargate_id
  end
end
