class ChangeRamActivities < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramActivities, :industry_activities
    change_table :industry_activities do |t|
      t.rename :activityID, :activity_id
      t.rename :activityName, :name
      t.rename :iconNo, :icon_number
    end
  end
  
  def data
    add_column :industry_activities, :data_export, :integer, null: false,
                                                             default: 1,
                                                             index: true
    
    IndustryActivity.reset_column_information
    IndustryActivity.where(published: false).update_all(data_export: 0)
    
    remove_column :industry_activities, :published
  end
  
  def rollback
    add_column :industry_activities, :published, :boolean, default: true
    
    IndustryActivity.reset_column_information
    IndustryActivity.where(data_export: 1).update_all(published: false)
    
    remove_column :industry_activities, :data_export
  end
end
