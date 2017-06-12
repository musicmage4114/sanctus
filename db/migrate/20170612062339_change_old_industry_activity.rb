class ChangeOldIndustryActivity < ActiveRecord::Migration[5.1]
  def change
    rename_table :industryActivity, :industry_times
    change_table :industry_times do |t|
      t.rename :typeID, :blueprint_id
      t.index :blueprint_id
      t.rename :activityID, :activity_type
    end
    add_foreign_key :industry_times, :industry_activities, column: :activity_type,
                                                           primary_key: :activity_id
  end
end
