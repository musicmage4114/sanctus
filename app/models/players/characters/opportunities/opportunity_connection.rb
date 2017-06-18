class OpportunityConnection < ApplicationRecord
  belongs_to :group,           class_name:  'OpportunityGroup',
                               primary_key: :group_id,
                               inverse_of:  :opportunity_connections
  belongs_to :connected_group, class_name:  'OpportunityGroup',
                               foreign_key: :connected_group_id,
                               primary_key: :group_id,
                               inverse_of:  :opportunity_connections
end
