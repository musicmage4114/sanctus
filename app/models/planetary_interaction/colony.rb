class Colony < ApplicationRecord
  # API data: string - planet_type
  enum planet_type: { shattered: 0,
               barren: 1,
               gas: 2,
               ice: 3,
               lava: 4,
               oceanic: 5,
               plasma: 6,
               storm: 7,
               temperate: 8 }
  
  belongs_to :planet,       inverse_of: :colonies
  belongs_to :owner,        class_name: 'Character', inverse_of: :colonies
  belongs_to :solar_system, inverse_of: :colonies
  
  has_many :links,  class_name: 'ColonyLink',
                    inverse_of: :colony,
                    dependent:  :destroy
  has_many :pins,   class_name: 'ColonyPin',
                    inverse_of: :colony,
                    dependent:  :destroy
  has_many :routes, class_name: 'ColonyRoute',
                    inverse_of: :colony,
                    dependent:  :destroy
  
  alias_attribute :system, :solar_system
  alias_attribute :type, :planet_type
end
