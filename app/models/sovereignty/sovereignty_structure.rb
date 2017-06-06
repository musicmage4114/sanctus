class SovereigntyStructure < ApplicationRecord
  self.primary_key = 'sov_structure_id'
  
  belongs_to :alliance,     inverse_of:  :sovereignty_structures
  belongs_to :solar_system, inverse_of:  :sovereignty_structures
  belongs_to :capturable,   polymorphic: true
  
  has_many :campaigns,      class_name:  'SovereigntyCampaign',
                            foreign_key: :sov_structure_id,
                            inverse_of:  :sovereignty_structure
end
