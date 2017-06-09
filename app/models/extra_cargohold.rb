class ExtraCargohold < ApplicationRecord
  enum hold_type: { none: 0,
                    fleet_hangar: 1,
                    ship_maintenance_bay: 2,
                    ore_hold: 3,
                    fighter_bay: 4,
                    fuel_bay: 5,
                    ammo_hold: 6,
                    pi_hold: 7,
                    mineral_hold: 8,
                    command_center_hold: 9,
                    corpse_hold: 10 }
  
  belongs_to :ship, foreign_key: :ship_id, inverse_of: :extra_cargoholds
end
