class Asset < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :item, foreign_key: :type_id, inverse_of: :assets
  belongs_to :owner, polymorphic: true
  belongs_to :location, polymorphic: true
end
