class CreateColonyWaypoints < ActiveRecord::Migration[5.1]
  def change
    create_table :colony_waypoints do |t|
      t.belongs_to :pin,   null: false, index: true
      t.belongs_to :route, null: false, index: true
      t.integer    :order
    end
    add_foreign_key :colony_waypoints, :colony_pins,   column: :pin_id,
                                                       primary_key: :pin_id
    add_foreign_key :colony_waypoints, :colony_routes, column: :route_id,
                                                       primary_key: :route_id
  end
end
