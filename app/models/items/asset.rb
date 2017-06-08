class Asset < ApplicationRecord
  self.primary_key = 'item_id'
  
  # API data: boolean - is_singleton
  enum singleton: { single: 1, multiple: 2 }
  
  belongs_to :ownable,     polymorphic: true
  belongs_to :asset_owner, polymorphic: true
  belongs_to :location,    polymorphic: true
end
