class AddForeignKeyToMilitiaCorporationId < ActiveRecord::Migration[5.1]
  class Faction < ActiveRecord::Base
  end
  
  def up
    Faction.reset_column_information
    Faction.where(militia_corporation_id: 0).update_all(militia_corporation_id: nil)
    add_foreign_key :factions, :corporations, column: :militia_corporation_id,
                                              primary_key: :corporation_id
  end
  
  def down
    remove_foreign_key :factions, :corporations
    
    Faction.reset_column_information
    Faction.find(500024).update(militia_corporation_id: 0)
  end
end
