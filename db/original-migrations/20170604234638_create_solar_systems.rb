class CreateSolarSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :solar_systems, id: false do |t|
      t.integer    :system_id,       null: false, index: { unique: true }
      t.belongs_to :constellation,   null: false, index: true
      t.string     :name,            null: false
      t.float      :security_status, null: false
      t.string     :security_class
      t.integer    :asteroid_belts
      t.integer    :ice_belts
      t.integer    :jumps_last_hour
      t.datetime   :last_jumps_check
      t.integer    :npc_kills_last_hour
      t.integer    :pod_kills_last_hour
      t.integer    :ship_kills_last_hour
      t.datetime   :last_kills_check
      
      # sovereignty
      t.belongs_to :faction,     index: true
      t.belongs_to :corporation, index: true
      t.belongs_to :alliance,    index: true
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z

      t.timestamps null: false
    end
    add_foreign_key :solar_systems, :constellations,     primary_key: :constellation_id
    add_foreign_key :bookmarks, :solar_systems,         primary_key: :system_id
    add_foreign_key :fleet_memberships, :solar_systems, primary_key: :system_id
    add_foreign_key :killmails, :solar_systems,         primary_key: :system_id
    add_foreign_key :factions, :solar_systems,          primary_key: :system_id
  end
end
