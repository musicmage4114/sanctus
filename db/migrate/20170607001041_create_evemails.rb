class CreateEvemails < ActiveRecord::Migration[5.1]
  def change
    create_table :evemails, id: false do |t|
      t.integer    :mail_id,       null: false, index: { unique: true }
      t.belongs_to :from,          null: false, index: true
      t.integer    :approved_cost, null: false, default: 0
      t.datetime   :timestamp
      t.string     :subject
      t.text       :body
    end
    add_foreign_key :evemails, :characters, column: :from_id, primary_key: :character_id
  end
end
