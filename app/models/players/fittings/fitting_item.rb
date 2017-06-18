class FittingItem < ApplicationRecord
  belongs_to :fitting, primary_key: :fitting_id, inverse_of: :fitting_items
  belongs_to :item,    foreign_key: :type_id,
                       primary_key: :type_id,
                       inverse_of:  :fitting_items
end
