class IndustryCostIndex < ApplicationRecord
  self.primary_key = 'system_id'
  
  belongs_to :solar_system, foreign_key: :system_id,
                            primary_key: :system_id,
                            inverse_of:  :industry_cost_indices
end
