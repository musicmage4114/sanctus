class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.datetime :date
      t.integer :duration
      t.text :description
      t.string :title
      t.belongs_to :host, polymorphic: true, index: true
      t.string :host_name
      
      # enum - supplied parameter: integer - importance
      # 1 = important, 0 = normal
      t.integer :importance, index: true
      
      t.timestamps
    end
  end
end
