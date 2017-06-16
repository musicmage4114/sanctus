class MarketGroup < ApplicationRecord
  self.primary_key = 'market_group_id'
  
  enum contains: [:groups, :items]

  belongs_to :icon,         primary_key: :icon_id, inverse_of: :market_groups
  belongs_to :parent_group, class_name:  'MarketGroup',
                            primary_key: :market_group_id,
                            inverse_of:  :market_groups
  
  has_many :child_groups, class_name: 'MarketGroup', inverse_of: :market_group
end
