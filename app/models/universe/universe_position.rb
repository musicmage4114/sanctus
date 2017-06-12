class UniversePosition < ApplicationRecord
  self.primary_key = 'item_id'
  
  has_many :universe_items, foreign_key: :item_id, inverse_of: :universe_position
end
