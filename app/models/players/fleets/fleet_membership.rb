class FleetMembership < ApplicationRecord
  # API data: boolean - takes_fleet_warp
  enum fleet_warp: [:disabled, :enabled]
  # API data: string - role
  enum role: { fleet_commander: 1,
               wing_commander:  2,
               squad_commander: 3,
               squad_member:    4 }

  belongs_to :solar_system, primary_key: :system_id,
                            inverse_of:  :fleet_memberships
  belongs_to :character,    primary_key: :character_id,
                            inverse_of:  :fleet_memberships
  belongs_to :fleet,        primary_key: :fleet_id, inverse_of: :fleet_memberships
  belongs_to :wing,         primary_key: :wing_id,
                            inverse_of:  :fleet_memberships,
                            optional:    true
  belongs_to :squad,        primary_key: :squad_id,
                            inverse_of:  :fleet_memberships,
                            optional:    true
  belongs_to :ship,         class_name:  'Item',
                            foreign_key: :ship_type_id,
                            primary_key: :type_id,
                            inverse_of:  :fleet_memberships
  belongs_to :dock,         polymorphic: true, optional: true
end
