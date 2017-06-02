class CreateWings < ActiveRecord::Migration[5.1]
  def change
    create_table :wings, id: false do |t|
      t.integer :wing_id, null: false, index: { unique: true }
      t.belongs_to :fleet, null: false, index: true
      t.string :name

      t.timestamps
    end
    add_foreign_key :wings, :fleets, primary_key: :fleet_id
    add_foreign_key :fleet_memberships, :wings, primary_key: :wing_id
    add_foreign_key :squads, :wings, primary_key: :wing_id
  end
end
