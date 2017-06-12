class ChangeEveGraphics < ActiveRecord::Migration[5.1]
  class Item < ActiveRecord::Base
  end
  
  def change
    rename_table :eveGraphics, :graphics
    change_table :graphics do |t|
      t.rename :graphicID, :graphic_id
      t.rename :sofFactionName, :sof_faction_name
      t.rename :graphicFile, :graphic_file
      t.rename :sofHullName, :sof_hull_name
      t.rename :sofRaceName, :sof_race_name
    end
  end
  
  def data
    Item.reset_column_information
    Item.where(graphic_id: 0).update_all(graphic_id: nil)
    add_foreign_key :items, :graphics, primary_key: :graphic_id
  end
  
  def rollback
    remove_foreign_key :items, :graphics, primary_key: :graphic_id
    Item.reset_column_information
    Item.where(graphic_id: nil).update_all(graphic_id: 0)
  end
end
