class ChangeIndustryActivityMaterials < ActiveRecord::Migration[5.1]
  def change
    rename_table :industryActivityMaterials, :blueprint_materials
    change_table :blueprint_materials do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :materialTypeID, :material_type_id
      t.index :material_type_id
      t.index [:blueprint_id, :material_type_id]
    end
    add_foreign_key :blueprint_materials, :industry_activities, column: :activity_type,
                                                                primary_key: :activity_id
  end
end
