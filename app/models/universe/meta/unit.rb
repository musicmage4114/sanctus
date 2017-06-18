class Unit < ApplicationRecord
  self.primary_key = 'unit_id'
  
  has_many :dogma_attributes, inverse_of: :unit
  has_many :bonus_traits,     inverse_of: :unit
end
