class ChangeInvNames < ActiveRecord::Migration[5.1]
  def change
    rename_table :invNames, :universe_entities
    change_table :universe_entities do |t|
      t.rename :itemID, :item_id
      t.rename :itemName, :name
    end
    add_foreign_key :universe_entities, :universe_items, column: :item_id,
                                                         primary_key: :item_id
    add_column :universe_items, :owner_type, :string, default: 'UniverseEntity'
    add_index :universe_items, [:owner_type, :owner_id]
  end
end
