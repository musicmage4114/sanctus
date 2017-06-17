class AssemblyLine < ApplicationRecord
  self.primary_key = 'assembly_line_id'

  enum activity_type: { none: 0,
                        manufacturing: 1,
                        technology: 2,
                        time_efficiency: 3,
                        material_efficiency: 4,
                        copying: 5,
                        duplicating: 6,
                        reverse_engineering: 7,
                        invention: 8 }
  
  belongs_to :industry_activity, foreign_key: :activity_type,
                                 primary_key: :activity_id,
                                 inverse_of:  :assembly_lines
  
  has_many :industry_facilities, inverse_of: :assembly_line
end
