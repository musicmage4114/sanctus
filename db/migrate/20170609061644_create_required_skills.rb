class CreateRequiredSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :required_skills, id: false do |t|
      t.belongs_to :skill_type,     null: false, index: true
      t.belongs_to :usable,         polymorphic: true, null: false, index: true
      t.integer    :required_level, null: false
    end
    add_foreign_key :required_skills, :ships, column: :skill_type_id,
                                              primary_key: :type_id
  end
end
