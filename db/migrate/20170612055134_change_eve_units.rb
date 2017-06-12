class ChangeEveUnits < ActiveRecord::Migration[5.1]
  def change
    rename_table :eveUnits, :units
    change_table :units do |t|
      t.rename :unitID, :unit_id
      t.rename :unitName, :name
      t.rename :displayName, :display_name
    end
    add_foreign_key :dogma_attributes, :units, primary_key: :unit_id
  end
end
