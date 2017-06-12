class ChangeEveIcons < ActiveRecord::Migration[5.1]
  def change
    rename_table :eveIcons, :icons
    change_table :icons do |t|
      t.rename :iconID, :icon_id
      t.rename :iconFile, :icon_file
    end
    add_index :ancestries, :icon_id
    add_index :bloodlines, :icon_id
    add_foreign_key :bloodlines, :icons,          primary_key: :icon_id
    add_index :corporations, :icon_id
    add_foreign_key :corporations, :icons,        primary_key: :icon_id
    add_foreign_key :dogma_attributes, :icons,    primary_key: :icon_id
    add_index :dogma_effects, :icon_id
    add_foreign_key :dogma_effects, :icons,       primary_key: :icon_id
    add_index :factions, :icon_id
    add_foreign_key :factions, :icons,            primary_key: :icon_id
    add_index :items, :icon_id
    add_foreign_key :items, :icons,               primary_key: :icon_id
    add_index :races, :icon_id
    add_foreign_key :races, :icons,               primary_key: :icon_id
    add_foreign_key :training_attributes, :icons, primary_key: :icon_id
  end
end
