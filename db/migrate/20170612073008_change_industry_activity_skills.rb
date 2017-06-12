class ChangeIndustryActivitySkills < ActiveRecord::Migration[5.1]
  def change
    rename_table :industryActivitySkills, :blueprint_skills
    change_table :blueprint_skills do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :skillID, :skill_id
      t.rename :level, :required_level
      t.index [:blueprint_id, :skill_id]
    end
    add_foreign_key :blueprint_skills, :items, column: :skill_id,
                                               primary_key: :type_id
    add_foreign_key :blueprint_skills, :industry_activities, column: :activity_type,
                                                             primary_key: :activity_id
  end
end
