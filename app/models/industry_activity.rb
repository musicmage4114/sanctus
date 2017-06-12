class IndustryActivity < ApplicationRecord
  self.primary_key = 'activity_id'
  
  has_many :industry_times, foreign_key: :activity_type,
                            inverse_of:  :industry_activities
end
