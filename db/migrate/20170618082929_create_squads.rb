class CreateSquads < ActiveRecord::Migration[5.1]
  def change
    create_table :squads, id: false do |t|
      t.integer    :squad_id, null: false, index: { unique: true }
      t.belongs_to :fleet,    null: false, index: true
      t.belongs_to :wing,     index: true
      t.string     :name
      
      t.timestamps null: false
    end
    add_foreign_key :squads, :fleets, primary_key: :fleet_id
  end
end
