class CreateEventResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :event_responses, id: false do |t|
      t.belongs_to :event,     null: false, index: true
      t.belongs_to :character, null: false, index: true
      t.integer    :response,  null: false, index: true
      
      t.index [:character_id, :event_id]
      t.timestamps
    end
    add_foreign_key :event_responses, :events,     primary_key: :event_id
    add_foreign_key :event_responses, :characters, primary_key: :character_id
  end
end
