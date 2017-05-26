class CreateDogmaAttributeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :dogma_attribute_values, id: false do |t|
      t.belongs_to :attribute, null: false, index: true
      t.belongs_to :type, null: false, index: true
      t.float :value, null: false
      t.index [:type_id, :attribute_id]
    end
    # foreign key: dogma_attribute_values -> dogma_attributes; column: attribute_id, primary key: attribute_id
    # foreign key: dogma_attribute_values -> items; column: type_id, primary key: type_id
  end
end