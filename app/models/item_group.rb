class ItemGroup < ApplicationRecord
  self.primary_key = 'group_id'

  # supplied parameter: boolean - published
  # true -> 1 -> published, false -> 0 -> unpublished
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_category, foreign_key: :category_id, inverse_of: :item_groups
  has_many :items, foreign_key: :group_id, inverse_of: :item_group
end
