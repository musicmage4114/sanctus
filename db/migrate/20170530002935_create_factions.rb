class CreateFactions < ActiveRecord::Migration[5.1]
  def change
    create_table :factions, id: false do |t|
      t.integer    :faction_id,   null: false, index: { unique: true }
      t.integer    :uniqueness,   null: false, default: 1, index: true
      t.belongs_to :corporation,  null: false, index: true
      t.string     :name,         null: false
      t.belongs_to :solar_system, index: true
      t.text       :description
      t.integer    :size_factor
      t.integer    :station_count
      t.integer    :station_system_count
    end
    add_foreign_key :factions, :corporations, primary_key: :corporation_id
    add_foreign_key :corporations, :factions, primary_key: :faction_id
  end
end