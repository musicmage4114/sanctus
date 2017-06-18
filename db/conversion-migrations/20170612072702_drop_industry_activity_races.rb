class DropIndustryActivityRaces < ActiveRecord::Migration[5.1]
  def change
    drop_table :industryActivityRaces, id: false do |t|
      t.integer :typeID, index: { name: 'ix_industryActivityRaces_typeID'}
      t.integer :activityID
      t.integer :productTypeID, index: { name: 'ix_industryActivityRaces_productTypeID'}
      t.integer :raceID
    end
  end
end
