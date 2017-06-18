class ChangeCrpNpcCorporationTrades < ActiveRecord::Migration[5.1]
  def change
    rename_table :crpNPCCorporationTrades, :npc_corp_item_offers
    change_table :npc_corp_item_offers do |t|
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :typeID, :type_id
      t.index :type_id
    end
    add_foreign_key :npc_corp_item_offers, :corporations, primary_key: :corporation_id
    add_foreign_key :npc_corp_item_offers, :items, column: :type_id,
                                                   primary_key: :type_id
  end
end
