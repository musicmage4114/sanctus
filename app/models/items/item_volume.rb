class ItemVolume < ApplicationRecord
  self.primary_key = 'type_id'
  
  belongs_to :item, foreign_key: :type_id,
                    primary_key: :type_id,
                    inverse_of:  :item_volumes
end
