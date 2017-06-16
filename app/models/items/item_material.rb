class ItemMaterial < ApplicationRecord
  belongs_to :base_item, class_name:  'Item',
                         foreign_key: :type_id,
                         primary_key: :type_id,
                         inverse_of:  :item_materials
  belongs_to :material,  class_name:  'Item',
                         foreign_key: :material_type_id,
                         primary_key: :type_id,
                         inverse_of:  :item_materials
end
