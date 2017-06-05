class CreateFleets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleets, id: false do |t|
      t.integer :fleet_id,  null: false, index: { unique: true }
      t.integer :free_move, null: false, default: 1, index: true
      t.integer :fleet_ad,  null: false, default: 0, index: true
      t.integer :eve_voice, null: false, default: 0, index: true
      t.text    :motd

      t.timestamps null: false
    end
  end
end
