class FleetMembership < ApplicationRecord
  # API data: boolean - takes_fleet_warp
  enum fleet_warp: [:disabled, :enabled]
  # API data: string - role
  enum role: { fleet_commander: 1,
               wing_commander:  2,
               squad_commander: 3,
               squad_member:    4 }

  belongs_to :solar_system, inverse_of:  :fleet_memberships
  belongs_to :character,    inverse_of:  :fleet_memberships
  belongs_to :fleet,        inverse_of:  :fleet_memberships
  belongs_to :wing,         inverse_of:  :fleet_memberships, optional: true
  belongs_to :squad,        inverse_of:  :fleet_memberships, optional: true
  belongs_to :ship,         foreign_key: :ship_type_id,
                            inverse_of:  :fleet_memberships
  belongs_to :dock,         polymorphic: true, optional: true
end