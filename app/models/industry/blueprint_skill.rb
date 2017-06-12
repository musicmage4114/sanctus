class BlueprintSkill < ApplicationRecord
  enum activity_type: { none: 0,
                        manufacturing: 1,
                        technology: 2,
                        time_efficiency: 3,
                        material_efficiency: 4,
                        copying: 5,
                        duplicating: 6,
                        reverse_engineering: 7,
                        invention: 8 }
  
  belongs_to :blueprint,         class_name: 'Item', inverse_of: :blueprint_skills
  belongs_to :skill,             class_name: 'Item', inverse_of: :blueprint_skills
  belongs_to :industry_activity, foreign_key: :activity_type,
                                 inverse_of:  :blueprint_skills
  
  alias_attribute :level, :required_level
end