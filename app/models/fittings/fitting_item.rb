class FittingItem < ApplicationRecord
  belongs_to :fitting, inverse_of: :fitting_items
  belongs_to :item,    foreign_key: :type_id, inverse_of: :fitting_items
end
