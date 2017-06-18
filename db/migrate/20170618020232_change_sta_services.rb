class ChangeStaServices < ActiveRecord::Migration[5.1]
  def change
    rename_table :staServices, :structure_services
    change_table :structure_services do |t|
      t.rename :serviceID, :service_id
      t.rename :serviceName, :name
    end
  end
end
