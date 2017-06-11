class CreateIncursions < ActiveRecord::Migration[5.1]
  def change
    create_table :incursions do |t|
      t.belongs_to :constellation,  null: false, index: true
      t.belongs_to :staging_system, null: false, index: true
      t.belongs_to :faction,        null: false, default: 500019, index: true
      t.integer    :state,          null: false, default: 1, index: true
      t.integer    :mothership,     null: false, default: 0, index: true
      t.string     :type,           null: false, default: 'Incursion'
      t.float      :influence,      null: false

      t.timestamps null: false
    end
    add_foreign_key :incursions, :constellations, primary_key: :constellation_id
    add_foreign_key :incursions, :factions,       primary_key: :faction_id
    add_foreign_key :incursions, :solar_systems,  column: :staging_system_id,
                                                  primary_key: :system_id
  end
end
