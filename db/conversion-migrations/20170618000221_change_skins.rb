class ChangeSkins < ActiveRecord::Migration[5.1]
  def change
    change_table :skins do |t|
      t.rename :skinID, :skin_id
      t.rename :internalName, :internal_name
      t.rename :skinMaterialID, :skin_material_id
      t.index :skin_material_id
    end
    add_foreign_key :skin_licenses, :skins, primary_key: :skin_id
    add_foreign_key :skins, :skin_materials, primary_key: :skin_material_id
    add_foreign_key :skin_ships, :skins, primary_key: :skin_id
    
    add_index :skin_materials, :display_name_id
    add_index :skin_materials, :material_set_id
  end
end
