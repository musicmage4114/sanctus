class Fleet < ApplicationRecord
  self.primary_key = 'fleet_id'
  
  # API data: boolean - is_free_move
  enum free_move: [:disabled, :enabled]
  # API: boolean - is_registered
  enum fleet_ad: [:inactive, :active]
  # API: boolean - is_voice_enabled
  enum eve_voice: [:disabled, :enabled]
  
  has_many :wings,             inverse_of: :fleet, dependent: :destroy
  has_many :squads,            inverse_of: :fleet, dependent: :destroy
  has_many :fleet_memberships, inverse_of: :fleet, dependent: :destroy
  has_many :members,           through: :fleet_memberships, source: :character
  # TODO: scope: :fleet_commander
  # TODO: scope: :wing_commanders
  # TODO: scope: :squad_commanders
  # TODO: scope: :squad members - by wing title?
end
