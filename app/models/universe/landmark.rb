class Landmark < ApplicationRecord
  self.primary_key = 'landmark_id'
  
  belongs_to :solar_system, inverse_of: :landmarks
  belongs_to :icon,         inverse_of: :landmarks
  
  alias_attribute :system, :solar_system
end
