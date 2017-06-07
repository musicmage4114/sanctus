class CreateMailLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_labels, id: false do |t|
      t.integer    :label_id,     null: false, index: { unique: true }
      t.string     :color,        null: false, default: '#ffffff'
      t.integer    :unread_count, null: false, default: 0
      t.belongs_to :character,    index: true
      t.string     :name
    end
    add_foreign_key :mail_labels, :characters, primary_key: :character_id
  end
end
