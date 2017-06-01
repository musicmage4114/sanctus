class CreateDogmaAttributeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :dogma_attribute_values, id: false do |t|
      t.belongs_to :attribute, null: false, index: true
      t.belongs_to :type, null: false, index: true
      t.float :value, null: false
      t.index [:type_id, :attribute_id]
    end
  end
end