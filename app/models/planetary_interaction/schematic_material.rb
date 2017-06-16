class SchematicMaterial < ApplicationRecord
  belongs_to :schematic, primary_key: :schematic_id,
                         inverse_of:  :schematic_materials
  belongs_to :material,  class_name:  'Item',
                         foreign_key: :material_id,
                         primary_key: :type_id,
                         inverse_of:  :schematic_materials
end
