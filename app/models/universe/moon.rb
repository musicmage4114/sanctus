class Moon < ApplicationRecord
  self.primary_key = 'moon_id'
  
  belongs_to :planet,       inverse_of: :moons
  belongs_to :solar_system, inverse_of: :moons
  
  has_many :moon_yields,    inverse_of: :moon
  
  alias_attribute :system, :solar_system
end
