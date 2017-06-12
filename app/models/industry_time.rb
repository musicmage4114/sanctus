class IndustryTime < ApplicationRecord
  belongs_to :blueprint,         class_name:  'Item', inverse_of: :industry_times
  belongs_to :industry_activity, foreign_key: :activity_type,
                                 inverse_of:  :industry_times
end
