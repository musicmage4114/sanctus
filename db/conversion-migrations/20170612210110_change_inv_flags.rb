class ChangeInvFlags < ActiveRecord::Migration[5.1]
  def change
    rename_table :invFlags, :inventory_flags
    change_table :inventory_flags do |t|
      t.rename :flagID, :flag_id
      t.rename :flagName, :name
      t.rename :flagText, :description
      t.rename :orderID, :order_id
    end
  end
end
