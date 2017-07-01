class ChangeRamAssemblyLineTypes < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramAssemblyLineTypes, :assembly_lines
    change_table :assembly_lines do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.rename :assemblyLineTypeName, :name
      t.rename :baseTimeMultiplier, :base_time_multiplier
      t.rename :baseMaterialMultiplier, :base_material_multiplier
      t.rename :baseCostMultiplier, :base_cost_multiplier
      t.rename :activityID, :activity_type
      t.rename :minCostPerHour, :min_cost_per_hour
    end
    add_foreign_key :industry_facilities, :assembly_lines, primary_key: :assembly_line_id
    add_foreign_key :assembly_lines, :industry_activities, column: :activity_type,
                                                           primary_key: :activity_id
  end
end
