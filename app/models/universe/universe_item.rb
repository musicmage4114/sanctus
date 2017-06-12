class UniverseItem < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :item,           foreign_key: :type_id, inverse_of: :universe_items
  belongs_to :inventory_flag, foreign_key: :flag_id, inverse_of: :universe_items
  belongs_to :location,       polymorphic: true
end
