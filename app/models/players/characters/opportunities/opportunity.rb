class Opportunity < ApplicationRecord
  self.primary_key = 'task_id'
  
  belongs_to :group, class_name:  'OpportunityGroup',
                     foreign_key: :group_id,
                     primary_key: :group_id,
                     inverse_of:  :opportunities
  
  has_many :character_opportunities, foreign_key: :task_id,
                                     inverse_of:  :opportunity
end
