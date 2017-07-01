class AddIndexToDivisionInNpcCorpDivisions < ActiveRecord::Migration[5.1]
  def change
    add_index :npc_corp_divisions, :division
  end
end
