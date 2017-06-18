class OpportunityGroup < ApplicationRecord
  self.primary_key = 'group_id'
  
  has_many :connections,      class_name:  'OpportunityConnection',
                              foreign_key: :group_id,
                              inverse_of:  :opportunity_group
  has_many :connected_groups, class_name:  'OpportunityGroup',
                              through:     :opportunity_connections,
                              source:      :group
  has_many :tasks,            class_name:  'Opportunity',
                              foreign_key: :group_id,
                              inverse_of:  :opportunity_group
end
