class Stargate < ApplicationRecord
  self.primary_key = 'stargate_id'
  
  belongs_to :solar_system,         inverse_of: :stargates
  belongs_to :stargate_type,        class_name: 'Item',        inverse_of: :stargates
  belongs_to :destination_stargate, class_name: 'Stargate',    inverse_of: :stargates
  belongs_to :destination_system,   class_name: 'SolarSystem', inverse_of: :stargates
  
  has_one :paired_stargate, class_name:  'Stargate',
                            foreign_key: :destination_stargate_id,
                            inverse_of:  :stargate
  
  alias_attribute :system, :solar_system
end
