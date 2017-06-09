class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships, id: false do |t|
      t.integer    :type_id,                null: false, index: { unique: true }
      t.integer    :data_export,            null: false, default: 1, index: true
      t.integer    :tech_level,             null: false, default: 1, index: true
      t.belongs_to :group,                  null: false, index: true
      t.belongs_to :graphic,                null: false, index: true
      t.belongs_to :faction,                null: false, index: true
      t.integer    :high_slots,             null: false, default: 0
      t.integer    :mid_slots,              null: false, default: 0
      t.integer    :low_slots,              null: false, default: 0
      t.integer    :rigs,                   null: false, default: 3
      t.integer    :calibration,            null: false, default: 400
      t.integer    :drone_capacity,         null: false, default: 0
      t.integer    :bandwidth,              null: false, default: 0
      t.integer    :max_targets,            null: false, default: 1
      t.float      :em_structure_resist,    null: false, default: 0
      t.float      :exp_structure_resist,   null: false, default: 0
      t.float      :kin_structure_resist,   null: false, default: 0
      t.float      :therm_structure_resist, null: false, default: 0
      t.float      :em_armor_resist,        null: false, default: 0
      t.float      :exp_armor_resist,       null: false, default: 0
      t.float      :kin_armor_resist,       null: false, default: 0
      t.float      :therm_armor_resist,     null: false, default: 0
      t.float      :em_shield_resist,       null: false, default: 0
      t.float      :exp_shield_resist,      null: false, default: 0
      t.float      :kin_shield_resist,      null: false, default: 0
      t.float      :therm_shield_resist,    null: false, default: 0
      t.float      :radar_strength,         null: false, default: 0
      t.float      :ladar_strength,         null: false, default: 0
      t.float      :gravimetric_strength,   null: false, default: 0
      t.float      :magnetometric_strength, null: false, default: 0
      t.integer    :launcher_hardpoints,    null: false, default: 0
      t.integer    :turret_hardpoints,      null: false, default: 0
      t.string     :name,                   null: false
      t.text       :description
      t.string     :hull_class
      t.string     :size_class
      t.string     :ship_type
      t.integer    :radius
      t.integer    :volume
      t.float      :capacity
      t.integer    :mass
      t.float      :powergrid
      t.float      :cpu
      t.float      :capacitor
      t.float      :max_target_range
      t.float      :max_velocity
      t.float      :inertia_modifier
      t.float      :base_warp_time
      t.float      :warp_speed
      t.integer    :structure_hp
      t.integer    :armor_hp
      t.integer    :shield_hp
      t.integer    :shield_recharge
      t.float      :signature_radius
      t.integer    :scan_resolution
    end
    add_foreign_key :ships, :factions, primary_key: :faction_id
  end
end
