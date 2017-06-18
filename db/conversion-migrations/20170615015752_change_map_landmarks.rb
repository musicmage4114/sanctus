class ChangeMapLandmarks < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapLandmarks, :landmarks
    change_table :landmarks do |t|
      t.rename :landmarkID, :landmark_id
      t.rename :landmarkName, :name
      t.rename :locationID, :solar_system_id
      t.rename :iconID, :icon_id
    end
    add_foreign_key :landmarks, :icons, primary_key: :icon_id
  end
end
