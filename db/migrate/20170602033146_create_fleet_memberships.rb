class CreateFleetMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :fleet_memberships, id: false do |t|
      t.belongs_to :character,    null: false, index: true
      t.belongs_to :fleet,        null: false, index: true
      t.belongs_to :wing,         null: false, index: true
      t.belongs_to :squad,        null: false, index: true
      t.belongs_to :ship_type,    null: false, index: true
      t.belongs_to :solar_system, null: false, index: true
      t.integer    :fleet_warp,   null: false, default: 1, index: true
      t.integer    :role,         null: false, default: 1, index: true
      t.datetime   :join_time,    null: false
      t.string     :role_name,    null: false
      t.belongs_to :dock,         polymorphic: true
      
      t.index [:fleet_id, :character_id]
      t.timestamps
    end
    add_foreign_key :fleet_memberships, :characters, primary_key: :character_id
    add_foreign_key :fleet_memberships, :fleets,     primary_key: :fleet_id
  end
end
