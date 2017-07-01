class CreateColonyPins < ActiveRecord::Migration[5.1]
  def change
    create_table :colony_pins, id: false do |t|
      t.integer    :pin_id,       null: false, index: { unique: true }
      t.belongs_to :colony,       null: false, index: true
      t.belongs_to :type,         null: false, index: true
      t.integer    :status,       null: false, default: 0, index: true
      t.belongs_to :product_type, index: true
      t.belongs_to :schematic,    index: true
      t.float      :latitude
      t.float      :longitude
      t.integer    :cycle_time
      t.integer    :quantity_per_cycle
      t.float      :head_radius
      t.datetime   :installed
      t.datetime   :last_cycle_start
      t.datetime   :expires
      
      t.timestamps
    end
    add_foreign_key :colony_pins, :colonies
    add_foreign_key :colony_pins, :schematics, primary_key: :schematic_id
    add_foreign_key :colony_pins, :items,      column: :product_type_id,
                                               primary_key: :type_id
    add_foreign_key :colony_pins, :items,      column: :type_id,
                                               primary_key: :type_id
  end
end
