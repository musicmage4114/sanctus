class BlueprintProductionLimit < ApplicationRecord
  belongs_to :blueprint, class_name:  'Item',
                         primary_key: :type_id,
                         inverse_of:  :blueprint_production_limits
end
