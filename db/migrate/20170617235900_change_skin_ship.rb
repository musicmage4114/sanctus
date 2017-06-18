class ChangeSkinShip < ActiveRecord::Migration[5.1]
  def change
    rename_table :skinShip, :skin_ships
    change_table :skin_ships do |t|
      t.rename :skinID, :skin_id
      t.rename :typeID, :type_id
    end
    add_foreign_key :skin_ships, :items, column: :type_id, primary_key: :type_id
  end
end
