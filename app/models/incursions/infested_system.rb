class InfestedSystem < ApplicationRecord
  # only "scout" is currently supported by API
  enum type: { scout: 1, vanguard: 2, assault: 3, headquarters: 4 }
  
  belongs_to :incursion,    inverse_of: :infested_systems
  belongs_to :solar_system, inverse_of: :infested_systems
end
