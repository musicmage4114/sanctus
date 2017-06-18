class OperationService < ApplicationRecord
  belongs_to :structure_operation, foreign_key: :operation_id,
                                   primary_key: :operation_id,
                                   inverse_of:  :operation_services
  belongs_to :structure_service,   foreign_key: :service_id,
                                   primary_key: :service_id,
                                   inverse_of:  :operation_services
end
