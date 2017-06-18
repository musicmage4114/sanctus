class StructureService < ApplicationRecord
  self.primary_key = 'service_id'
  
  has_many :associated_operations, class_name: 'OperationService',
                                   foreign_key: :service_id,
                                   inverse_of:  :structure_service
  has_many :operations, through: :associated_operations, source: :operation
end
