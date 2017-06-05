class CreateDogmaAttributeValues < ActiveRecord::Migration[5.0]
  def change
    create_table :dogma_attribute_values, id: false do |t|
      t.belongs_to :attribute, null: false, index: true
      t.belongs_to :entity,    polymorphic: true,
                               null: false,
                               index: true
      t.decimal    :value,     null: false
    end
  end
end