class Landmark < ApplicationRecord
  self.primary_key = 'landmark_id'
  
  belongs_to :solar_system, primary_key: :system_id, inverse_of: :landmarks
  belongs_to :icon,         primary_key: :icon_id,   inverse_of: :landmarks
  
  alias_attribute :system, :solar_system
end
