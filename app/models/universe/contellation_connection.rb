class ContellationConnection < ApplicationRecord
  belongs_to :from_constellation, class_name: 'Constellation',
                                  inverse_of: :constellation_connections
  belongs_to :to_constellation,   class_name: 'Constellation',
                                  inverse_of: :constellation_connections
  belongs_to :from_region,        class_name: 'Region',
                                  inverse_of: :constellation_connections
  belongs_to :to_region,          class_name: 'Region',
                                  inverse_of: :constellation_connections
end
