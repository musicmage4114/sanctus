class ChangeRamAssemblyLineTypeDetailPerGroup < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramAssemblyLineTypeDetailPerGroup, :assembly_groups
    change_table :assembly_groups do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.rename :groupID, :group_id
      t.rename :timeMultiplier, :time_multiplier
      t.rename :materialMultiplier, :material_multiplier
      t.rename :costMultiplier, :cost_multiplier
    end
    add_foreign_key :assembly_groups, :assembly_lines, primary_key: :assembly_line_id
    add_foreign_key :assembly_groups, :item_groups,    column: :group_id,
                                                       primary_key: :group_id
  end
end
