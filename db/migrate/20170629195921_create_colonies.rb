class CreateColonies < ActiveRecord::Migration[5.1]
  def change
    create_table :colonies do |t|
      t.belongs_to :planet,       null: false, index: true
      t.belongs_to :owner,        null: false, index: true
      t.belongs_to :solar_system, null: false, index: true
      t.integer    :planet_type,  null: false, index: true
      t.integer    :pin_count
      t.integer    :upgrade_level
      t.datetime   :last_update
    end
    add_foreign_key :colonies, :planets,       primary_key: :planet_id
    add_foreign_key :colonies, :characters,    column: :owner_id,
                                               primary_key: :character_id
    add_foreign_key :colonies, :solar_systems, primary_key: :system_id
  end
end
