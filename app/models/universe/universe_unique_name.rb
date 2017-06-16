class UniverseUniqueName < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :item_group, foreign_key: :group_id,
                          primary_key: :group_id,
                          inverse_of:  :universe_unique_names
end
