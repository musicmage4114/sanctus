class CreateKillmails < ActiveRecord::Migration[5.1]
  def change
    create_table :killmails, id: false do |t|
      t.integer    :killmail_id,        null: false, index: { unique: true }
      t.belongs_to :victim,             null: false, index: true
      t.belongs_to :solar_system,       null: false, index: true
      t.belongs_to :victim_ship_type,   null: false, index: true
      t.belongs_to :victim_corporation, index: true
      t.belongs_to :victim_alliance,    index: true
      t.belongs_to :victim_faction,     index: true
      t.belongs_to :moon,               index: true
      t.belongs_to :war,                index: true
      t.belongs_to :final_blow,         polymorphic: true,
                                        null: false,
                                        index: true
      t.datetime   :time
      t.integer    :damage_taken
      t.float      :total_value
      t.float      :dropped_value
      t.float      :destroyed_value
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :killmails, :characters,   column: :victim_id,
                                               primary_key: :character_id
    add_foreign_key :killmails, :corporations, column: :victim_corporation_id,
                                               primary_key: :corporation_id
    add_foreign_key :killmails, :alliances,    column: :victim_alliance_id,
                                               primary_key: :alliance_id
    add_foreign_key :killmails, :factions,     column: :victim_faction_id,
                                               primary_key: :faction_id
  end
end
