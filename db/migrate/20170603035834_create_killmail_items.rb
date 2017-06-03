class CreateKillmailItems < ActiveRecord::Migration[5.1]
  def change
    create_table :killmail_items do |t|
      t.belongs_to :killmail,      null: false, index: true
      t.integer    :stack,         null: false, default: 1, index: true
      t.belongs_to :killmail_item, index: true
      t.belongs_to :killmail_loot, polymorphic: true,
                                   null: false,
                                   index: { name: 'killmail_loot_index' }
      t.integer    :flag
      t.integer    :quantity_destroyed
      t.integer    :quantity_dropped
      t.float      :total_value
      t.float      :dropped_value
      t.float      :destroyed_value
    end
    add_foreign_key :killmail_items, :killmails, primary_key: :killmail_id
    add_foreign_key :killmail_items, :killmail_items
  end
end
