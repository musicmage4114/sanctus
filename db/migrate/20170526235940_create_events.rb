class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, id: false do |t|
      t.integer :event_id, null: false, index: { unique: true }
      t.datetime :date, null: false
      t.integer :duration
      t.text :description
      t.string :title
      t.belongs_to :host, polymorphic: true, index: true
      t.string :host_name
      t.integer :importance, null: false, default: 0, index: true
      
      t.timestamps
    end
  end
end
