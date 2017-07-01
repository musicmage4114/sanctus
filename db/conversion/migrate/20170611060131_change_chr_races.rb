class ChangeChrRaces < ActiveRecord::Migration[5.1]
  def change
    rename_table :chrRaces, :races
    change_table :races do |t|
      t.rename :raceID, :race_id
      t.rename :raceName, :name
      t.rename :iconID, :icon_id
      t.rename :shortDescription, :short_description
    end
    add_foreign_key :bloodlines, :races, primary_key: :race_id
  end
end
