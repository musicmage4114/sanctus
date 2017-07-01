class CreateSkillQueueEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_queue_entries, id: false do |t|
      t.belongs_to :character,         null: false, index: true
      t.belongs_to :skill_type,        null: false, index: true
      t.integer    :queue_position,    null: false
      t.integer    :training_start_sp, null: false, default: 0
      t.integer    :skill_id
      t.datetime   :start
      t.datetime   :finish
      t.integer    :level_start_sp
      t.integer    :level_end_sp
      t.integer    :finished_level
    end
    add_foreign_key :skill_queue_entries, :characters, primary_key: :character_id
    add_foreign_key :skill_queue_entries, :items,      column: :skill_type_id,
                    primary_key: :type_id
  end
end
