class BlueprintProductionLimit < ApplicationRecord
  belongs_to :blueprint, class_name: 'Item', inverse_of: :blueprint_production_limits
end
