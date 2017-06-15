class ChangeMapLocationScenes < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapLocationScenes, :region_scenes
    change_table :region_scenes do |t|
      t.rename :locationID, :region_id
      t.rename :graphicID, :graphic_id
      t.index :graphic_id
      t.index [:region_id, :graphic_id]
    end
    add_foreign_key :region_scenes, :graphics, primary_key: :graphic_id
  end
end
