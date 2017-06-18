class ChangeStaOperationServices < ActiveRecord::Migration[5.1]
  def change
    rename_table :staOperationServices, :operation_services
    change_table :operation_services do |t|
      t.rename :operationID, :operation_id
      t.rename :serviceID, :service_id
    end
    add_foreign_key :operation_services, :structure_operations, column: :operation_id,
                                                                primary_key: :operation_id
    add_foreign_key :operation_services, :structure_services, column: :service_id,
                                                              primary_key: :service_id
  end
end
