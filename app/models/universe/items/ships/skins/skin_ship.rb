class SkinShip < ApplicationRecord
  belongs_to :skin, primary_key: :skin_id, inverse_of: :skin_ships
  belongs_to :ship, class_name: 'Item',
                    foreign_key: :type_id,
                    primary_key: :type_id,
                    inverse_of:  :skin_ships
end
