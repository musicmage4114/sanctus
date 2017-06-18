class UniverseEntity < ApplicationRecord
  self.primary_key = 'item_id'
  
  has_many :universe_items, as: :owner
end
