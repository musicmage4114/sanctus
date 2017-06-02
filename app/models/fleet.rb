class Fleet < ApplicationRecord
  self.primary_key = 'fleet_id'
  
  # supplied parameter: boolean - is_free_move
  # true -> 1 -> enabled, false -> 0 -> disabled
  enum free_move: [:disabled, :enabled]
  # supplied parameter: boolean - is_registered
  # true -> 1 -> active, false -> 0 -> inactive
  enum fleet_ad: [:inactive, :active]
  # supplied parameter: boolean - is_voice_enabled
  # true -> 1 -> enabled, false -> 0 -> disabled
  enum eve_voice: [:disabled, :enabled]
  
  has_many :wings, inverse_of: :fleet, dependent: :destroy
  has_many :squads, inverse_of: :fleet, dependent: :destroy
  has_many :fleet_memberships, inverse_of: :fleet, dependent: :destroy
  has_many :members, through: :fleet_memberships, source: :character
  # TODO: scope: :fleet_commander
  # TODO: scope: :wing_commanders
  # TODO: scope: :squad_commanders
  # TODO: scope: :squad members - by wing title?
end
