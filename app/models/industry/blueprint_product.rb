class BlueprintProduct < ApplicationRecord
  enum activity_type: { none: 0,
                        manufacturing: 1,
                        technology: 2,
                        time_efficiency: 3,
                        material_efficiency: 4,
                        copying: 5,
                        duplicating: 6,
                        reverse_engineering: 7,
                        invention: 8 }
  
  belongs_to :blueprint,         class_name:  'Item',
                                 inverse_of:  :blueprint_products
  belongs_to :product,           class_name:  'Item',
                                 foreign_key: :product_type_id
  belongs_to :industry_activity, foreign_key: :activity_type,
                                 inverse_of:  :blueprint_products
end
