class ItemCategory < ApplicationRecord
  self.primary_key = 'category_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :icon, inverse_of: :item_categories
  
  has_many :item_groups, foreign_key: :category_id, inverse_of: :item_category
  
  alias_attribute :groups, :item_groups
end
