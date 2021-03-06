class IndustryActivity < ApplicationRecord
  self.primary_key = 'activity_id'
  
  has_many :industry_times,         foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
  has_many :blueprint_materials,    foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
  has_many :industry_probabilities, foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
  has_many :blueprint_products,     foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
  has_many :blueprint_skills,       foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
  has_many :assembly_lines,         foreign_key: :activity_type,
                                    inverse_of:  :industry_activity
end
