class ItemAsset < ApplicationRecord
  self.primary_key = 'item_id'
  
  # API data: boolean - is_singleton
  enum quantity: { single: 1, multiple: 2 }
  
  belongs_to :item,     foreign_key: :type_id,
                        primary_key: :type_id,
                        inverse_of:  :assets
  belongs_to :owner,    polymorphic: true
  belongs_to :location, polymorphic: true
end
