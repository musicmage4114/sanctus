class ChangeSkinMaterials < ActiveRecord::Migration[5.1]
  def change
    rename_table :skinMaterials, :skin_materials
    change_table :skin_materials do |t|
      t.rename :skinMaterialID, :skin_material_id
      t.rename :displayNameID, :display_name_id
      t.rename :materialSetID, :material_set_id
    end
  end
end
