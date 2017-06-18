class MetaItemGroup < ApplicationRecord
  self.primary_key = 'meta_group_id'
  
  belongs_to :icon, primary_key: :icon_id, inverse_of: :meta_item_groups
end
