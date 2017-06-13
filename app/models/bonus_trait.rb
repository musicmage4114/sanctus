class BonusTrait < ApplicationRecord
  self.primary_key = 'trait_id'

  belongs_to :unit,                         inverse_of: :bonus_traits
  belongs_to :item,  foreign_key: :type_id, inverse_of: :bonus_traits
  belongs_to :skill, class_name:  'Item',   inverse_of: :bonus_traits
  
  # TODO: Remove html links from :description, but preserve link destination ID
end
