class SystemConnection < ApplicationRecord
  belongs_to :from_system, class_name: 'SolarSystem',
                           inverse_of: :system_connections
  belongs_to :to_system,   class_name: 'SolarSystem',
                           inverse_of: :system_connections
end
