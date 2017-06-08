class CreatePersonalBlueprints < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_blueprints, id: false do |t|
      t.integer    :item_id,             null: false, index: { unique: true }
      t.belongs_to :type,                null: false, index: true
      t.belongs_to :character,           null: false, index: true
      t.integer    :material_efficiency, null: false
      t.integer    :quantity,            null: false
      t.integer    :runs,                null: false
      t.integer    :time_efficiency,     null: false
      t.belongs_to :location,            polymorphic: true,
                                         null: false,
                                         index: { name: 'item_location_index' }
      
      t.index [:character_id, :type_id]
      t.timestamps null: false
    end
    add_foreign_key :personal_blueprints, :blueprints, column: :type_id,
                                                       primary_key: :type_id
    add_foreign_key :personal_blueprints, :characters, primary_key: :character_id
  end
end
