class CreateCharacterOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :character_opportunities, id: false do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :task,      null: false, index: true
      t.datetime   :completed
      
      t.index [:character_id, :task_id]
    end
    add_foreign_key :character_opportunities, :characters,    primary_key: :character_id
    add_foreign_key :character_opportunities, :opportunities, column: :task_id,
                                                              primary_key: :task_id
  end
end
