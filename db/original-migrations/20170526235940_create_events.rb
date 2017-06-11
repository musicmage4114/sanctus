class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: false do |t|
      t.integer    :event_id,   null: false, index: { unique: true }
      t.integer    :importance, null: false, default: 0, index: true
      t.datetime   :date,       null: false
      t.belongs_to :host,       polymorphic: true, index: true
      t.integer    :duration
      t.text       :description
      t.string     :title
      t.string     :host_name
      
      t.timestamps null: false
    end
  end
end
