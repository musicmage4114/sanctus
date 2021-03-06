class IndustryTime < ApplicationRecord
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
                                 primary_key: :type_id,
                                 inverse_of:  :industry_times
  belongs_to :industry_activity, foreign_key: :activity_type,
                                 primary_key: :activity_id,
                                 inverse_of:  :industry_times
end
