class SchematicMaterial < ApplicationRecord
  belongs_to :schematic, inverse_of:  :schematic_materials
  belongs_to :material,  class_name:  'Item',
                         foreign_key: :material_id,
                         inverse_of:  :schematic_materials
end
