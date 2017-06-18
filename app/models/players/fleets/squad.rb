class Squad < ApplicationRecord
  self.primary_key = 'squad_id'
  
  belongs_to :fleet, primary_key: :fleet_id, inverse_of: :squads
  belongs_to :wing,  primary_key: :wing_id,  inverse_of: :squads, optional: true
  
  has_many :squad_members, class_name: 'FleetMembership', inverse_of: :squad
  # TODO: scope: squad_commander
  
  alias_attribute :members, :squad_members
end
