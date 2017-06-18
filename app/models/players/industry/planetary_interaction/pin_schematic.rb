class PinSchematic < ApplicationRecord
  belongs_to :schematic, primary_key: :schematic_id, inverse_of: :pin_schematics
  belongs_to :pin_type,  class_name:  'Item',
                         foreign_key: :pin_type_id,
                         primary_key: :type_id,
                         inverse_of:  :pin_schematics
end
