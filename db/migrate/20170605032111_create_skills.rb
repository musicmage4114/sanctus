class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills, id: false do |t|
      t.integer    :type_id,     null: false, index: { unique: true }
      t.integer    :data_export, null: false, default: 1, index: true
      t.belongs_to :group,       null: false, index: true
      t.string     :name,        null: false
      t.text       :description, null: false
      t.integer    :skill_id
    end
  end
end
