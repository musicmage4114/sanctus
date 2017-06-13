class ChangeInvVolumes < ActiveRecord::Migration[5.1]
  def change
    rename_table :invVolumes, :item_volumes
    change_table :item_volumes do |t|
      t.rename :typeID, :type_id
    end
    add_foreign_key :item_volumes, :items, column: :type_id, primary_key: :type_id
  end
end
