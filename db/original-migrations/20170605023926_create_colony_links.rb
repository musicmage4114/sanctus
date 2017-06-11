class CreateColonyLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :colony_links do |t|
      t.belongs_to :source_pin,      null: false, index: true
      t.belongs_to :destination_pin, null: false, index: true
      t.integer    :link_level,      null: false
    end
    add_foreign_key :colony_links, :colony_pins, column: :source_pin_id,
                                                 primary_key: :pin_id
    add_foreign_key :colony_links, :colony_pins, column: :destination_pin_id,
                                                 primary_key: :pin_id
  end
end
