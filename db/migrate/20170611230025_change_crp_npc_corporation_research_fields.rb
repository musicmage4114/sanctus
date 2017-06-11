class ChangeCrpNpcCorporationResearchFields < ActiveRecord::Migration[5.1]
  def change
    rename_table :crpNPCCorporationResearchFields, :npc_corp_research
    change_table :npc_corp_research do |t|
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :skillID, :skill_type_id
      t.index :skill_type_id
    end
    add_foreign_key :npc_corp_research, :corporations, primary_key: :corporation_id
  end
end
