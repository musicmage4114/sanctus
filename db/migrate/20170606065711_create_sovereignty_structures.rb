class CreateSovereigntyStructures < ActiveRecord::Migration[5.1]
  def change
    create_table :sovereignty_structures, id: false do |t|
      t.integer    :sov_structure_id, null: false, index: { unique: true }
      t.belongs_to :alliance,         null: false, index: true
      t.belongs_to :solar_system,     null: false, index: true
      t.belongs_to :capturable,       polymorphic: true,
                                      null: false,
                                      index: { name: 'sovereignty_structure_index' }
      t.float      :vulnerability_occupancy_level
      t.datetime   :vulnerable_start_time
      t.datetime   :vulnerable_end_time

      t.timestamps null: false
    end
    add_foreign_key :sovereignty_structures, :alliances,     primary_key: :alliance_id
    add_foreign_key :sovereignty_structures, :solar_systems, primary_key: :system_id
    add_foreign_key :sovereignty_campaigns, :sovereignty_structures, column: :sov_structure_id,
                                                             primary_key: :sov_structure_id
  end
end
