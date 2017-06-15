class ConstellationConnection < ApplicationRecord
  belongs_to :from_constellation, class_name: 'Constellation',
                                  inverse_of: :constellation_connections
  belongs_to :to_constellation,   class_name: 'Constellation',
                                  inverse_of: :constellation_connections
end
