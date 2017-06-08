class FittingItem < ApplicationRecord
  belongs_to :fitting,     inverse_of: :fitting_items
  belongs_to :fitted_item, polymorphic: true
end
