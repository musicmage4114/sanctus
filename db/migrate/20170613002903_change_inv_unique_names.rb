class ChangeInvUniqueNames < ActiveRecord::Migration[5.1]
  def change
    rename_table :invUniqueNames, :universe_unique_names
    change_table :universe_unique_names do |t|
      t.rename :itemID, :item_id
      t.rename :itemName, :name
      t.rename :groupID, :group_id
      t.index [:item_id, :name]
    end
    add_foreign_key :universe_unique_names, :universe_items, column: :item_id,
                                                             primary_key: :item_id
    add_foreign_key :universe_unique_names, :item_groups,    column: :group_id,
                                                             primary_key: :group_id
  end
end
