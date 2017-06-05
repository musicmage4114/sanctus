class Stargate < ApplicationRecord
  self.primary_key = 'stargate_id'
  
  belongs_to :solar_system,      inverse_of:  :stargates
  
  has_one :destination,          class_name:  'SolarSystem',
                                 foreign_key: :destination_id,
                                 inverse_of:  :stargate
  has_one :destination_stargate, class_name:  'Stargate',
                                 foreign_key: :destination_stargate_id,
                                 inverse_of:  :stargate
  
  alias_attribute :system, :solar_system
end
