class ChangeChrAncestries < ActiveRecord::Migration[5.1]
  def change
    rename_table "chrAncestries", :ancestries
    change_table :ancestries do |t|
      t.rename :ancestryID, :ancestry_id
      t.rename :ancestryName, :name
      t.rename :bloodlineID, :bloodline_id
      t.rename :iconID, :icon_id
      t.rename :shortDescription, :short_description
    end
  end
end
