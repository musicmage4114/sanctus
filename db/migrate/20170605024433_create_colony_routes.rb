class CreateColonyRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :colony_routes, id: false do |t|
      t.integer    :route_id,        null: false, index: { unique: true }
      t.belongs_to :source_pin,      null: false, index: true
      t.belongs_to :destination_pin, null: false, index: true
      t.belongs_to :content,         polymorphic: true, index: true
      t.float      :quantity
    end
    add_foreign_key :colony_routes, :colony_pins, column: :source_pin_id,
                                                  primary_key: :pin_id
    add_foreign_key :colony_routes, :colony_pins, column: :destination_pin_id,
                                                  primary_key: :pin_id
  end
end
