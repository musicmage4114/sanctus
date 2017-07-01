class DropCrpActivities < ActiveRecord::Migration[5.1]
  def change
    drop_table :crpActivities do |t|
      t.integer :activityID, null: false, index: { unique: true }
      t.string :activityName, limit: 100
      t.string :description, limit: 1000
    end
  end
end
