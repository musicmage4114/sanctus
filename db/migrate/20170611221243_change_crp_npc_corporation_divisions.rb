class ChangeCrpNpcCorporationDivisions < ActiveRecord::Migration[5.1]
  def change
    rename_table :crpNPCCorporationDivisions, :npc_corp_divisions
    change_table :npc_corp_divisions do |t|
      t.rename :corporationID, :corporation_id
      t.rename :divisionID, :division
    end
    add_foreign_key :npc_corp_divisions, :corporations, primary_key: :corporation_id
  end
end
