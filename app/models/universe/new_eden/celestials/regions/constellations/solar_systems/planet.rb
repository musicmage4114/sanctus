class Planet < ApplicationRecord
  self.primary_key = 'planet_id'

  # API data - boolean - published
  enum data_export: [:unpublished, :published]
  # API data - item name retrieved via type_id
  enum type: { shattered: 0,
               barren: 1,
               gas: 2,
               ice: 3,
               lava: 4,
               oceanic: 5,
               plasma: 6,
               storm: 7,
               temperate: 8 }
  
  belongs_to :solar_system, primary_key: :system_id, inverse_of: :planets
  belongs_to :item_group,   foreign_key: :group_id,
                            primary_key: :group_id,
                            inverse_of:  :planets
  
  has_many :moons,    inverse_of: :planet
  has_many :colonies, inverse_of: :planet
  
  alias_attribute :system, :solar_system
end
