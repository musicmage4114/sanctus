class CreateMailLabelAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_label_assignments, id: false do |t|
      t.belongs_to :label,   null: false, index: true
      t.belongs_to :evemail, null: false, index: true
      
      t.index [:label_id, :evemail_id], name: 'mail_label_assignments_index'
    end
    add_foreign_key :mail_label_assignments, :mail_labels, column: :label_id,
                                             primary_key: :label_id
    add_foreign_key :mail_label_assignments, :evemails,    column: :evemail_id,
                                             primary_key: :mail_id
  end
end
