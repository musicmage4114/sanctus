class CreateMailRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_recipients, id: false do |t|
      t.belongs_to :recipient, null: false, index: true
      t.belongs_to :evemail,   null: false, index: true
      t.integer    :status,    null: false, default: 0
      
      t.index [:recipient_id, :evemail_id]
    end
    add_foreign_key :mail_recipients, :characters, column: :recipient_id,
                                                   primary_key: :character_id
    add_foreign_key :mail_recipients, :evemails,   primary_key: :mail_id
  end
end
