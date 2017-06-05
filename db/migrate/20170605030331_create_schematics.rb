class CreateSchematics < ActiveRecord::Migration[5.1]
  def change
    create_table :schematics, id: false do |t|
      t.integer :schematic_id, null: false, index: { unique: true }
      t.string  :name,         null: false
      t.integer :cycle_time,   null: false
    end
  end
  add_foreign_key :colony_pins, :schematics, primary_key: :schematic_id
end
