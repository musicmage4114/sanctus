class ChangeInvTypeMaterials < ActiveRecord::Migration[5.1]
  def change
    rename_table :invTypeMaterials, :item_materials
    change_table :item_materials do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :materialTypeID, :material_type_id
      t.index :material_type_id
    end
    add_foreign_key :item_materials, :items, column: :material_type_id,
                                             primary_key: :type_id
  end
end
