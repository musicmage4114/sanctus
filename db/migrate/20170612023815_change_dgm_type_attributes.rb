class ChangeDgmTypeAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_table :dgmTypeAttributes, :dogma_attribute_values
    change_table :dogma_attribute_values do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :attributeID, :attribute_id
      t.rename :valueInt, :value_integer
      t.rename :valueFloat, :value_float
    end
    add_foreign_key :dogma_attribute_values, :dogma_attributes, column: :attribute_id,
                                                                primary_key: :attribute_id
  end
end
