class CreateExtraCargoholds < ActiveRecord::Migration[5.1]
  def change
    create_table :extra_cargoholds, id: false do |t|
      t.belongs_to :ship,      null: false, index: true
      t.integer    :hold_type, null: false, default: 0, index: true
      t.float      :capacity
    end
    add_foreign_key :extra_cargoholds, :ships, column: :ship_id, primary_key: :type_id
  end
end
