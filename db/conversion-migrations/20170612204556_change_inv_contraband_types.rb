class ChangeInvContrabandTypes < ActiveRecord::Migration[5.1]
  def change
    rename_table :invContrabandTypes, :contraband
    change_table :contraband do |t|
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :typeID, :type_id
      t.rename :standingLoss, :standing_loss
      t.rename :confiscateMinSec, :confiscate
      t.rename :fineByValue, :fine_by_value
      t.rename :attackMinSec, :attack
      t.index [:faction_id, :type_id]
    end
    add_foreign_key :contraband, :factions, primary_key: :faction_id
    add_foreign_key :contraband, :items,    column: :type_id, primary_key: :type_id
  end
end
