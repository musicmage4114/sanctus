class CreateDogmaAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :dogma_attributes, id: false do |t|
      t.integer :attribute_id, null: false, index: { unique: true }
      t.float :default_value
      t.text :description
      t.string :display_name
      t.belongs_to :icon, index: true
      t.string :name
      t.integer :unit_id, index: true
      t.integer :good, index: true
      t.integer :stacking, index: true
      t.integer :data_export, null: false, default: 1, index: true
    end
  end
end
