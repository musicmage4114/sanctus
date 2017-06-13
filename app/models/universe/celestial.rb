class Celestial < ApplicationRecord
  self.primary_key = 'celestial_id'
  
  belongs_to :universe_item, foreign_key: :celestial_id, inverse_of: :celestials
end
