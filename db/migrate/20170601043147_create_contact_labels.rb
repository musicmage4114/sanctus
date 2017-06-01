class CreateContactLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_labels, id: false do |t|
      t.integer :label_id, null: false, index: { unique: true }
      t.belongs_to :character, null: false, index: true
      t.string :name
    end
    add_foreign_key :contact_labels, :characters, primary_key: :character_id
    add_foreign_key :contacts, :contact_labels, column: :label_id, primary_key: :label_id
  end
end
