class ChangeCrpNpcDivisions < ActiveRecord::Migration[5.1]
  def change
    rename_table :crpNPCDivisions, :corp_division_details
    change_table :corp_division_details do |t|
      t.rename :divisionID, :division_id
      t.rename :leaderType, :leader_title
    end
    add_foreign_key :agents, :corp_division_details, column: :division,
                                                     primary_key: :division_id
    add_foreign_key :npc_corp_divisions, :corp_division_details, column: :division,
                                                                 primary_key: :division_id
  end
end
