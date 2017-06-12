class AddMemberRaceToFactions < ActiveRecord::Migration[5.1]
  class Race < ActiveRecord::Base
  end
  
  def up
    add_column :factions, :member_race, :integer, index: true
    
    Faction.reset_column_information
    Faction.update_all(member_race: :race_id)
    Faction.where(race_id: [9, 15]).update_all(race_id: nil)
    
    add_foreign_key :factions, :races, primary_key: :race_id
  end
  
  def down
    remove_foreign_key :factions, :races, primary_key: :race_id
    
    Faction.reset_column_information
    Faction.update_all(race_id: :member_race)
    
    remove_column :factions, :member_race
  end
end
