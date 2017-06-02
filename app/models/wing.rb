class Wing < ApplicationRecord
  self.primary_key = 'wing_id'
  
  belongs_to :fleet, inverse_of: :wings
  has_many :squads, inverse_of: :wing
  has_many :wing_members, class_name: 'FleetMembership', inverse_of: :wing
  # TODO: :wing_commander
  
  alias_attribute :members, :wing_members
end
