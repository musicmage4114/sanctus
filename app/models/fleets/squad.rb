class Squad < ApplicationRecord
  self.primary_key = 'squad_id'
  
  belongs_to :fleet, inverse_of: :squads
  belongs_to :wing,  inverse_of: :squads, optional: true
  
  has_many :squad_members, class_name: 'FleetMembership', inverse_of: :squad
  # TODO: scope: squad_commander
  
  alias_attribute :members, :squad_members
end
