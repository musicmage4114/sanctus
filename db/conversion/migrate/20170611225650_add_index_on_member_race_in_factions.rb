class AddIndexOnMemberRaceInFactions < ActiveRecord::Migration[5.1]
  def change
    add_index :factions, :member_race
  end
end
