class Incursion < ApplicationRecord
  # API data: string - state
  enum state: { established: 1, mobilizing: 2, withdrawing: 3 }
  # API data: boolean - has_boss
  enum mothership: [:not_spawned, :spawned]
  
  belongs_to :constellation,  inverse_of: :incursions
  belongs_to :staging_system, class_name: 'SolarSystem', inverse_of: :incursions
  belongs_to :faction,        inverse_of: :incursions
  
  has_many :infested_systems, inverse_of: :incursion
end
