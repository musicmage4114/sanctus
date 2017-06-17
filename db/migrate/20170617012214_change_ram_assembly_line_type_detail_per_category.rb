class ChangeRamAssemblyLineTypeDetailPerCategory < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramAssemblyLineTypeDetailPerCategory, :assembly_categories
    change_table :assembly_categories do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.rename :categoryID, :category_id
      t.rename :timeMultiplier, :time_multiplier
      t.rename :materialMultiplier, :material_multiplier
      t.rename :costMultiplier, :cost_multiplier
    end
    add_foreign_key :assembly_categories, :assembly_lines, primary_key: :assembly_line_id
    add_foreign_key :assembly_categories, :item_categories, column: :category_id,
                                                            primary_key: :category_id
  end
end
