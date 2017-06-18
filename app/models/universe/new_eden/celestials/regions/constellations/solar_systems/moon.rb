class Moon < ApplicationRecord
  self.primary_key = 'moon_id'
  
  belongs_to :planet,       primary_key: :planet_id, inverse_of: :moons
  belongs_to :solar_system, primary_key: :system_id, inverse_of: :moons
  
  has_many :moon_yields,    inverse_of: :moon
  
  alias_attribute :system, :solar_system
end
