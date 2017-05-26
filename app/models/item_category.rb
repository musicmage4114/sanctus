class ItemCategory < ApplicationRecord
  self.primary_key = 'category_id'

  # supplied parameter: boolean - published
  # true -> 1 -> published, false -> 0 -> unpublished
  enum usage: [:unpublished, :published]
  
  has_many :item_groups, foreign_key: :category_id, inverse_of: :item_category
  
  alias_attribute :groups, :item_groups
end
