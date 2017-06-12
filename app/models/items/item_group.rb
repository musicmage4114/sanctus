class ItemGroup < ApplicationRecord
  self.primary_key = 'group_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_category, foreign_key: :category_id, inverse_of: :item_groups
  
  has_many :members,           class_name:  'Item',
                               foreign_key: :group_id,
                               inverse_of:  :item_group
  has_many :dogma_expressions, inverse_of:  :item_group
  
  alias_attribute :expressions, :dogma_expressions
end
