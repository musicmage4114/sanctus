class ChangeChrBloodlines < ActiveRecord::Migration[5.1]
  def change
    rename_table :chrBloodlines, :bloodlines
    change_table :bloodlines do |t|
      t.rename :bloodlineID, :bloodline_id
      t.rename :raceID, :race_id
      t.index :race_id
      t.rename :maleDescription, :male_description
      t.rename :femaleDescription, :female_description
      t.rename :shipTypeID, :ship_type_id
      t.index :ship_type_id
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :iconID, :icon_id
      t.rename :shortDescription, :short_description
      t.rename :shortMaleDescription, :short_male_description
      t.rename :shortFemaleDescription, :short_female_description
    end
    add_foreign_key :ancestries, :bloodlines, primary_key: :bloodline_id
  end
end
