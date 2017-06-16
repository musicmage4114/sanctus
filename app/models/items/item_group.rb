class ItemGroup < ApplicationRecord
  self.primary_key = 'group_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_category, foreign_key: :category_id,
                             primary_key: :category_id,
                             inverse_of:  :item_groups
  belongs_to :icon,          primary_key: :icon_id,
                             inverse_of:  :item_groups
  
  has_many :items,                  foreign_key: :group_id,
                                    inverse_of:  :item_group
  has_many :dogma_expressions,      inverse_of:  :item_group
  has_many :certificates,           foreign_key: :group_id,
                                    inverse_of:  :item_group
  has_many :unique_names,           class_name:  'UniverseUniqueName',
                                    foreign_key: :group_id,
                                    inverse_of:  :item_group
  has_many :denormalized_map_items, foreign_key: :group_id,
                                    inverse_of:  :item_group
  
  alias_attribute :members, :items
  alias_attribute :expressions, :dogma_expressions
end
