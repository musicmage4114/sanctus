class UniverseItem < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :item,           foreign_key: :type_id, inverse_of: :universe_items
  belongs_to :inventory_flag, foreign_key: :flag_id, inverse_of: :universe_items
  belongs_to :owner,          polymorphic: true
  belongs_to :location,       polymorphic: true
  
  has_one :unique_name,       class_name:  'UniverseUniqueName',
                              foreign_key: :item_id,
                              inverse_of:  :universe_item
  has_one :celestial_details, class_name:  'Celestial',
                              foreign_key: :celestial_id,
                              inverse_of:  :universe_item
end
