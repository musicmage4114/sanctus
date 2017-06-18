class Stargate < ApplicationRecord
  self.primary_key = 'stargate_id'
  
  belongs_to :solar_system,         primary_key: :system_id,
                                    inverse_of:  :stargates
  belongs_to :stargate_type,        class_name:  'Item',
                                    primary_key: :type_id,
                                    inverse_of:  :stargates
  belongs_to :destination_stargate, class_name:  'Stargate',
                                    primary_key: :stargate_id,
                                    inverse_of:  :stargates
  belongs_to :destination_system,   class_name:  'SolarSystem',
                                    primary_key: :system_id,
                                    inverse_of:  :stargates
  
  has_one :paired_stargate, class_name:  'Stargate',
                            foreign_key: :destination_stargate_id,
                            inverse_of:  :stargate
  
  alias_attribute :system, :solar_system
end
