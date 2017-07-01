class CreateCharacterSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :character_skills, id: false do |t|
      t.belongs_to :character,     null: false, index: true
      t.belongs_to :skill_type,    null: false, index: true
      t.integer    :current_level, null: false, default: 0
      t.integer    :skillpoints
      t.integer    :skill_id
      
      t.timestamps null: false
    end
    add_foreign_key :character_skills, :characters, primary_key: :character_id
    add_foreign_key :character_skills, :items,      column: :skill_type_id,
                                                    primary_key: :type_id
  end
end
