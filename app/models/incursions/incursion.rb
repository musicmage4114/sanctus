class Incursion < ApplicationRecord
  # API data: string - state
  enum state: { established: 1, mobilizing: 2, withdrawing: 3 }
  # API data: boolean - has_boss
  enum mothership: [:not_spawned, :spawned]
  
  belongs_to :constellation,  primary_key: :constellation_id,
                              inverse_of:  :incursions
  belongs_to :staging_system, class_name:  'SolarSystem',
                              primary_key: :system_id,
                              inverse_of:  :incursions
  belongs_to :faction,        primary_key: :faction_id,
                              inverse_of:  :incursions
  
  has_many :infested_systems, inverse_of: :incursion, dependent: :destroy
end
