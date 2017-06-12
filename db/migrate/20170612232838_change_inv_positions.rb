class ChangeInvPositions < ActiveRecord::Migration[5.1]
  def change
    rename_table :invPositions, :universe_positions
    change_table :universe_positions do |t|
      t.rename :itemID, :item_id
    end
    add_foreign_key :universe_positions, :universe_items, column: :item_id,
                                                          primary_key: :item_id
  end
end
